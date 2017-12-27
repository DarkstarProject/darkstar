#pragma once
#include "lua.hpp"

// A C ++ object binding with Lua objects
template <typename T> class Lunar 
{

  // The structure of encapsulating a C ++ object in a Lua object
  struct user_t
  {
	  T *pT; 
  };
public:
  typedef int (T::*mfp)(lua_State *L);

  // Structure for gluing the methods of the Lua object to the methods of the C++ object
  struct Register_t
  { 
	  const char *name; 
	  mfp mfunc; 
  };

  static void Register(lua_State *L) 
  {
    
    // method table of the object
    lua_newtable(L);
    int methods = lua_gettop(L);

	  // metatable table of future objects
    luaL_newmetatable(L, T::className);
    int metatable = lua_gettop(L);

    // Place the method table in a global variable
    // so that the lua code can add methods.
    lua_pushvalue(L, methods);
    lua_setglobal(L, T::className);

    // get meta attributes by getmetattable()
    lua_pushvalue(L, methods);
    set(L, metatable, "__metatable");

    // Set the value of the __index meta table field
    // the address of the method table, in order to
    // you could use the syntax obj: method ()
    lua_pushvalue(L, methods);
    set(L, metatable, "__index");
	
    // Set the value of the __tostring field of the meta table,
    // so that you can display the object in text form.
    lua_pushcfunction(L, tostring_T);
    set(L, metatable, "__tostring");
	
    // Set the value of the __gc meta table field
    // so that the garbage collector can remove our objects
    lua_pushcfunction(L, gc_T);
    set(L, metatable, "__gc");

    // Add a new table to
    // make it metatable method table.
    lua_newtable(L);

    // Add the Object Constraint Function
    lua_pushcfunction(L, new_T);

    // copy the function address for two cases.
    lua_pushvalue(L, -1); 

    // set the new method to the table, to implement the constructor Class:new()
    set(L, methods, "new");

    // Set the __call method of the meta table to
    // you could use the Class() method.
    set(L, -3, "__call");           // mt.__call = new_T
    lua_setmetatable(L, methods);

    // Fill the lua table with methods from the class.
    for (Register_t *l = T::methods; l->name; ++l) 
    {
	    // adding method name
      lua_pushstring(L, l->name);

	    // adding a gluing parameter.
      lua_pushlightuserdata(L, (void*)l);

	    // adding a special glue.
      lua_pushcclosure(L, thunk, 1);

      lua_settable(L, methods);
    }

    lua_pop(L, 2);  
  }

  // Calling a method from user_t
  static int call(lua_State *L, const char *method,
                  int nargs=0, int nresults=LUA_MULTRET, int errfunc=0)
  {

	  // Index on the stack for user_t
    int base = lua_gettop(L) - nargs;  

	  // Type check user_t
    if (!luaL_checkudata(L, base, T::className)) 
    {

      // Delete all data
      lua_settop(L, base-1);   

      lua_pushfstring(L, "not a valid %s userdata", T::className);
      return -1;
    }

    // method name
    lua_pushstring(L, method);    

    // get method from userdata
    lua_gettable(L, base);     

    // The method is found?
    if (lua_isnil(L, -1)) 
    {  

      // Delete all data    
      lua_settop(L, base-1);          
      lua_pushfstring(L, "%s missing method '%s'", T::className, method);
      return -1;
    }

    // put method under userdata, args
    lua_insert(L, base);             

    // Calling the method
    int status = lua_pcall(L, 1+nargs, nresults, errfunc); 
    if (status) 
    {
      const char *msg = lua_tostring(L, -1);
      if (msg == NULL) msg = "(error with no message)";
      lua_pushfstring(L, "%s:%s status = %d\n%s",
                      T::className, method, status, msg);

      // remove old message
      lua_remove(L, base);            
      return -1;
    }

    // number of returned results
    return lua_gettop(L) - base + 1;  
  }

  // Adding a user-defined data type containing a pointer to the stack T * obj
  static int push(lua_State *L, T *obj, bool gc=false) 
  {
    if (!obj) 
	  { 
		lua_pushnil(L); 
		return 0;
    } 

    // search the meta-table in the registry.
    luaL_getmetatable(L, T::className); 

    if (lua_isnil(L, -1)) luaL_error(L, "%s missing metatable", T::className);
    int mt = lua_gettop(L);
    subtable(L, mt, "userdata", "v");
    
	user_t *ud = static_cast<user_t*>(pushuserdata(L, obj, sizeof(user_t)));

    if (ud) 
    {

      // pointer placement in user_t
      ud->pT = obj; 
      lua_pushvalue(L, mt);
      lua_setmetatable(L, -2);
      if (gc == false)
      {
        lua_checkstack(L, 3);
        subtable(L, mt, "do not trash", "k");
        lua_pushvalue(L, -2);
        lua_pushboolean(L, 1);
        lua_settable(L, -3);
        lua_pop(L, 1);
      }
    }
    lua_replace(L, mt);
    lua_settop(L, mt);

    // index userdata contains a pointer to T * obj
    return mt;  
  }

  // return T * from stack
  static T *check(lua_State *L, int narg) 
  {
    user_t *ud =
      static_cast<user_t*>(luaL_checkudata(L, narg, T::className));
    
    if(!ud) 
    {
        luaL_typerror(L, narg, T::className);
        return NULL;
    }

    // pointer to T object
    return ud->pT; 
  }

private:

  // we hide the default constructor.
  Lunar(); 

  // decompressor of the member function.
  static int thunk(lua_State *L) 
  {
    // The stack contains user_t, which follows directly from the arguments.
    T *obj = check(L, 1);  

    lua_remove(L, 1);  

    // We get the value of the registration associated with the unpacker
    Register_t *l = static_cast<Register_t*>(lua_touserdata(L, lua_upvalueindex(1)));

    // Calling the method of the object.
    return (obj->*(l->mfunc))(L);  
  }

  // Create a new object and add it to the top of the stack
  static int new_T(lua_State *L) 
  {
    // removing 'self'
    lua_remove(L, 1);  

    // Constructor call
    T *obj = new T(L); 

    // gc_T will remove this object when needed
    push(L, obj, true); 

    return 1;           
  }

  // garbage collection
  static int gc_T(lua_State *L) 
  {
    if (luaL_getmetafield(L, 1, "do not trash")) 
    {
      // duplicate userdata
      lua_pushvalue(L, 1);

      lua_gettable(L, -2);

      // do not delete object
      if (!lua_isnil(L, -1)) return 0; 
    }

    user_t *ud = static_cast<user_t*>(lua_touserdata(L, 1));
    T *obj = ud->pT;
    if (obj) delete obj;  

    return 0;
  }

  static int tostring_T (lua_State *L) 
  {
    char buff[32];
    user_t *ud = static_cast<user_t*>(lua_touserdata(L, 1));
    T *obj = ud->pT;
    sprintf(buff, "%p", (void*)obj);
    lua_pushfstring(L, "%s (%s)", T::className, buff);

    return 1;
  }

  static void set(lua_State *L, int table_index, const char *key)
  {
    lua_pushstring(L, key);

    // swap value and key
    lua_insert(L, -2);  

    lua_settable(L, table_index);
  }

  static void weaktable(lua_State *L, const char *mode)
  {
    lua_newtable(L);

    // table is its own metatable
    lua_pushvalue(L, -1); 

    lua_setmetatable(L, -2);
    lua_pushliteral(L, "__mode");
    lua_pushstring(L, mode);

    // metatable.__mode = mode
    lua_settable(L, -3);  
  }

  static void subtable(lua_State *L, int tindex, const char *name, const char *mode) 
  {
    lua_pushstring(L, name);
    lua_gettable(L, tindex);

    if (lua_isnil(L, -1)) 
    {
      lua_pop(L, 1);
      lua_checkstack(L, 3);
      weaktable(L, mode);
      lua_pushstring(L, name);
      lua_pushvalue(L, -2);
      lua_settable(L, tindex);
    }
  }

  static void *pushuserdata(lua_State *L, void *key, size_t sz) 
  {
    void *ud = 0;
    lua_pushlightuserdata(L, key);

    // lookup[key]
    lua_gettable(L, -2);  

    if (lua_isnil(L, -1))
     {
      // drop nil
      lua_pop(L, 1);  

      lua_checkstack(L, 3);

      // create new userdata
      ud = lua_newuserdata(L, sz);

      lua_pushlightuserdata(L, key);

      // duplicate userdata
      lua_pushvalue(L, -2); 

      // lookup[key] = userdata
      lua_settable(L, -4);   
    }

    return ud;
  }
};

#define LUNAR_DECLARE_METHOD(Class, Name) {#Name, &Class::Name}