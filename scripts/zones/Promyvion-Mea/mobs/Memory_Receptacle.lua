-----------------------------------
-- Area: Promyvion-Mea
--  MOB: Memory Receptacle
-- Todo: clean up disgustingly bad formatting
-----------------------------------
package.loaded["scripts/zones/Promyvion-Mea/TextIDs"] = nil;
-----------------------------------
require( "scripts/zones/Promyvion-Mea/TextIDs" );
require("scripts/globals/status");

-----------------------------------
-- onMobInitialize Action
-----------------------------------

function onMobInitialize(mob)
    mob:addMod(MOD_REGAIN, 100); -- 10% Regain for now
    mob:SetAutoAttackEnabled(false); -- Recepticles only use TP moves.
end;

-----------------------------------
-- onMobFight Action
-----------------------------------
function onMobFight(mob, target)

     local Mem_Recep = mob:getID();

     if (Mem_Recep == 16859151) then -- Floor 1
       for i = Mem_Recep+1, Mem_Recep+3 do -- Keep pets linked
          if (GetMobAction(i) == 16) then
             GetMobByID(i):updateEnmity(target);
           end
        end
     elseif (Mem_Recep == 16859198 or Mem_Recep == 16859205 or Mem_Recep == 16859212 or Mem_Recep == 16859219) then -- Floor 2
       for i = Mem_Recep+1, Mem_Recep+5 do
          if (GetMobAction(i) == 16) then
             GetMobByID(i):updateEnmity(target);
           end
        end
     elseif (Mem_Recep == 16859273 or Mem_Recep == 16859282 or Mem_Recep == 16859291 or Mem_Recep == 16859349 or Mem_Recep == 16859358 or Mem_Recep == 16859367) then -- Floor 3
       for i = Mem_Recep+1, Mem_Recep+7 do
          if (GetMobAction(i) == 16) then
             GetMobByID(i):updateEnmity(target);
           end
        end
   end

   -- Summons a single stray every 30 seconds.

   if (mob:getBattleTime() % 30 < 3 and mob:getBattleTime() > 3 and (Mem_Recep == 16859151) and mob:AnimationSub() == 2) then -- Floor 1
      for i = Mem_Recep+1, Mem_Recep+3 do
         if (GetMobAction(i) == 0) then -- My Stray is deeaaaaaad!
                 mob:AnimationSub(1);
            SpawnMob(i):updateEnmity(target);
            GetMobByID(i):setPos(mob:getXPos()+1, mob:getYPos(), mob:getZPos()+1); -- Set stray x and z position +1 from Recepticle
            return;
         end
      end
   elseif (mob:getBattleTime() % 30 < 3 and mob:getBattleTime() > 3 and (Mem_Recep == 16859198 or Mem_Recep == 16859205 or Mem_Recep == 16859212 or -- Floor 2
    Mem_Recep == 16859219) and mob:AnimationSub() == 2) then
      for i = Mem_Recep+1, Mem_Recep+5 do
         if (GetMobAction(i) == 0) then
                 mob:AnimationSub(1);
            SpawnMob(i):updateEnmity(target);
            GetMobByID(i):setPos(mob:getXPos()+1, mob:getYPos(), mob:getZPos()+1);
            return;
         end
      end
   elseif (mob:getBattleTime() % 30 < 3 and mob:getBattleTime() > 3 and (Mem_Recep == 16859273 or Mem_Recep == 16859282 or Mem_Recep == 16859291 or -- Floor 3
    Mem_Recep == 16859349 or Mem_Recep == 16859358 or Mem_Recep == 16859367) and mob:AnimationSub() == 2) then
      for i = Mem_Recep+1, Mem_Recep+7 do
         if (GetMobAction(i) == 0) then
                 mob:AnimationSub(1);
            SpawnMob(i):updateEnmity(target);
            GetMobByID(i):setPos(mob:getXPos()+1, mob:getYPos(), mob:getZPos()+1);
            return;
         end
      end
   else
           mob:AnimationSub(2);
   end
end;


-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    local rand = 0;
    local mobID = mob:getID();
    local difX = player:getXPos()-mob:getXPos();
    local difY = player:getYPos()-mob:getYPos();
    local difZ = player:getZPos()-mob:getZPos();
    local killeranimation = player:getAnimation();
    local Distance = math.sqrt( math.pow(difX,2) + math.pow(difY,2) + math.pow(difZ,2) ); --calcul de la distance entre les "killer" et le memory receptacle
    --print(mobID);

    mob:AnimationSub(0); -- Set ani. sub to default or the recepticles wont work properly

    if (VanadielMinute() % 2 == 1) then
        player:setVar("MemoryReceptacle",2);
        rnd = 2;
    else
        player:setVar("MemoryReceptacle",1);
        rnd = 1;
    end


    switch (mob:getID()) : caseof {
        [16859151] = function (x)
        GetNPCByID(16859453):openDoor(180);
            if (Distance <4 and killeranimation == 0) then
                    player:startEvent(30);
            end
        end,
        [16859198] = function (x)
        GetNPCByID(16859456):openDoor(180);
            if (Distance <4 and killeranimation == 0) then
                 if (rnd == 2) then
                    player:startEvent(37); -- player:setPos(-167,0,172,38);
                else
                    player:startEvent(33); -- player:setPos(68,0,-76,254);
                end
            end
        end,
        [16859205] = function (x)
        GetNPCByID(16859460):openDoor(180);
            if (Distance <4 and killeranimation == 0) then
                 if (rnd == 2) then
                    player:startEvent(37); -- player:setPos(-167,0,172,38);
                else
                    player:startEvent(33); -- player:setPos(68,0,-76,254);
                end
            end
        end,
        [16859212] = function (x)
        GetNPCByID(16859461):openDoor(180);
            if (Distance <4 and killeranimation == 0) then
                 if (rnd == 2) then
                    player:startEvent(37); -- player:setPos(-167,0,172,38);
                else
                    player:startEvent(33); -- player:setPos(68,0,-76,254);
                end
            end
        end,
        [16859219] = function (x)
        GetNPCByID(16859462):openDoor(180);
            if (Distance <4 and killeranimation == 0) then
                 if (rnd == 2) then
                    player:startEvent(37); -- player:setPos(-167,0,172,38);
                else
                    player:startEvent(33); -- player:setPos(68,0,-76,254);
                end
            end
        end,
        [16859273] = function (x)
        GetNPCByID(16859454):openDoor(180);
            if (Distance <4 and killeranimation == 0) then
                    player:startEvent(31);
            end
        end,
        [16859282] = function (x)
        GetNPCByID(16859455):openDoor(180);
            if (Distance <4 and killeranimation == 0) then
                    player:startEvent(31);
            end
        end,
        [16859291] = function (x)
        GetNPCByID(16859457):openDoor(180);
            if (Distance <4 and killeranimation == 0) then
                    player:startEvent(31);
            end
        end,
        [16859349] = function (x)
        GetNPCByID(16859458):openDoor(180);
            if (Distance <4 and killeranimation == 0) then
                    player:startEvent(31);
            end
        end,
        [16859358] = function (x)
        GetNPCByID(16859459):openDoor(180);
            if (Distance <4 and killeranimation == 0) then
                    player:startEvent(31);
            end
        end,
        [16859367] = function (x)
        GetNPCByID(16859463):openDoor(180);
            if (Distance <4 and killeranimation == 0) then
                    player:startEvent(31);
            end
        end,
    }
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;

----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
   if (option==1) then
    player:setVar("MemoryReceptacle",0);
    end
end;