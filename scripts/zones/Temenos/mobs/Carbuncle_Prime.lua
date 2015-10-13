-----------------------------------
-- Area: Temenos E T	
-- NPC: mystic Avatar

-----------------------------------
package.loaded["scripts/zones/Temenos/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/limbus");
require("scripts/zones/Temenos/TextIDs");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- onMobEngaged
-----------------------------------

function onMobEngaged(mob,target)
   local mobID = mob:getID();
  if (mobID==16929030) then
  	    GetMobByID(16929032):updateEnmity(target);
  	    GetMobByID(16929031):updateEnmity(target);

	if (IsMobDead(16929033)==true and IsMobDead(16929039)==true) then
	mob:setMod(MOD_FIREDEF,-128);	
	else
	mob:setMod(MOD_FIREDEF,256);
	end	
	if (IsMobDead(16929034)==true and IsMobDead(16929040)==true) then
    mob:setMod(MOD_ICEDEF,-128);
    else	
	mob:setMod(MOD_ICEDEF,256);
	end
	if (IsMobDead(16929035)==true and IsMobDead(16929041)==true) then
	mob:setMod(MOD_WINDDEF,-128);
	else
    mob:setMod(MOD_WINDDEF,256);
	end
	if (IsMobDead(16929036)==true and IsMobDead(16929042)==true) then
	mob:setMod(MOD_EARTHDEF,-128);	
	else
	mob:setMod(MOD_EARTHDEF,256);
	end
	if (IsMobDead(16929034)==true and IsMobDead(16929043)==true) then
    mob:setMod(MOD_THUNDERDEF,-128);
    else	
	mob:setMod(MOD_THUNDERDEF,256);
	end
	if (IsMobDead(16929038)==true and IsMobDead(16929044)==true) then
	mob:setMod(MOD_WATERDEF,-128);
	else
    mob:setMod(MOD_WATERDEF,256);	
    end		
      mob:setMod(MOD_LIGHTDEF,256);
      mob:setMod(MOD_DARKDEF,-128);	
  end
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   local mobID = mob:getID();	
  if (mobID==16929030) then
          if (IsMobDead(16929031)==true and IsMobDead(16929032)==true ) then
        	GetNPCByID(16928768+77):setPos(0.5,-6,-459);
	        GetNPCByID(16928768+77):setStatus(STATUS_NORMAL);
	        GetNPCByID(16928768+472):setStatus(STATUS_NORMAL);
          end
  end
end;
