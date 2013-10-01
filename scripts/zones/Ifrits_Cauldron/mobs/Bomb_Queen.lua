-----------------------------------
-- Area: Ifrit's Cauldron
-- Mob:  Bomb Queen
-----------------------------------
package.loaded["scripts/zones/Ifrits_Cauldron/TextIDs"] = nil;
-----------------------------------

require( "scripts/zones/Ifrits_Cauldron/TextIDs" );

-----------------------------------
-- onMobInitialize Action
-----------------------------------
function onMobInitialize(mob)
   mob:setExtraVar(os.time()); -- Need this for onMobRoam
end


-----------------------------------
-- onMobSpawn Action
-----------------------------------

function OnMobSpawn(mob)
   mob:setExtraVar(os.time());
end;

-----------------------------------
-- onMobFight Action
-----------------------------------
function onMobFight(mob, target)

local princess = 17617159, 17617161
local prince = 17617160, 17617162
local bastard = 17617163

   -- Keep pets linked
   for i = 17617159, 17617160, 17617161, 17617162, 17617163 do
      if (GetMobAction(i) == 16) then
         GetMobByID(i):updateEnmity(target);
      end
   end

   -- Summons a single orb every 30 seconds.  Needs to be last, so other code runs.
   if (mob:getExtraVar(1) + 30 <= os.time()) then
   			if(math.random((1),(25)) <= 12) then
         		if (GetMobAction(princess) == 0) then -- Princess Spawn
            	 SpawnMob(princess):updateEnmity(target);
           		 GetMobByID(princess):setPos(mob:getXPos(), mob:getYPos(), mob:getZPos());
           		 mob:setExtraVar(os.time());
            	 return;
            end	 
   			elseif(math.random((13),(25)) <= 24) then
         		if (GetMobAction(prince) == 0) then -- Prince Spawn
            	 SpawnMob(prince):updateEnmity(target);
           		 GetMobByID(prince):setPos(mob:getXPos(), mob:getYPos(), mob:getZPos());
           		 mob:setExtraVar(os.time());
            	 return;   
            end	 
   			else
         		if (GetMobAction(bastard) == 0) then -- Bastard Spawn
            	 SpawnMob(bastard):updateEnmity(target);
           		 GetMobByID(bastard):setPos(mob:getXPos(), mob:getYPos(), mob:getZPos());
           		 mob:setExtraVar(os.time());
            	 return;  
            end	             	          	 
        end
   end
end

-----------------------------------
-- onMobRoam Action
-----------------------------------
function OnMobRoam(mob)
   local timer = mob:getExtraVar(1);
   local mobid = mob:getID();

   -- Periodically make the chain grow.
   if (timer + 30 <= os.time()) then
   			if(math.random((1),(25)) <= 12) then
         		if (GetMobAction(princess) == 0) then -- Princess Spawn
            	 SpawnMob(princess)
           		 GetMobByID(princess):setPos(mob:getXPos(), mob:getYPos(), mob:getZPos());
           		 mob:setExtraVar(os.time());
            	 return;
            end	 
   			elseif(math.random((13),(25)) <= 24) then
         		if (GetMobAction(prince) == 0) then -- Prince Spawn
            	 SpawnMob(prince)
           		 GetMobByID(prince):setPos(mob:getXPos(), mob:getYPos(), mob:getZPos());
           		 mob:setExtraVar(os.time());
            	 return;   
            end	 
   			else
         		if (GetMobAction(bastard) == 0) then -- Bastard Spawn
            	 SpawnMob(bastard)
           		 GetMobByID(bastard):setPos(mob:getXPos(), mob:getYPos(), mob:getZPos());
           		 mob:setExtraVar(os.time());
            	 return;  
            end	 
        end
   end
end

-----------------------------------
-- onMobDeath
-----------------------------------
function onMobDeath( mob, killer )

   for i = 17617159, 17617160, 17617161, 17617162, 17617163 do
      if (GetMobAction(i) ~= 0) then
         DespawnMob(i);
      end
   end
end

