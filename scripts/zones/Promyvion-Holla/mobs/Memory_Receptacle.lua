-----------------------------------
-- Area: Promyvion-Holla
--  MOB: Memory Receptacle
-- Todo: clean up disgustingly bad formatting
-----------------------------------
package.loaded["scripts/zones/Promyvion-Holla/TextIDs"] = nil;
-----------------------------------
require( "scripts/zones/Promyvion-Holla/TextIDs" );
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

    if (Mem_Recep == 16842781) then -- Floor 1
    for i = Mem_Recep+1, Mem_Recep+3 do -- Keep pets linked
        if (GetMobAction(i) == 16) then
            GetMobByID(i):updateEnmity(target);
        end
    end
     elseif (Mem_Recep == 16842839 or Mem_Recep == 16842846 or Mem_Recep == 16842853 or Mem_Recep == 16842860) then -- Floor 2
       for i = Mem_Recep+1, Mem_Recep+5 do
          if (GetMobAction(i) == 16) then
             GetMobByID(i):updateEnmity(target);
           end
        end
     elseif (Mem_Recep == 16842886 or Mem_Recep == 16842895 or Mem_Recep == 16842904 or Mem_Recep == 16842938 or Mem_Recep == 16842947 or -- Floor 3
      Mem_Recep == 16842956) then
       for i = Mem_Recep+1, Mem_Recep+7 do
          if (GetMobAction(i) == 16) then
             GetMobByID(i):updateEnmity(target);
           end
        end
   end

   -- Summons a single stray every 30 seconds.

   if (mob:getBattleTime() % 30 < 3 and mob:getBattleTime() > 3 and (Mem_Recep == 16842781) and mob:AnimationSub() == 2) then -- Floor 1
      for i = Mem_Recep+1, Mem_Recep+3 do
         if (GetMobAction(i) == 0) then -- My Stray is deeaaaaaad!
                 mob:AnimationSub(1);
            SpawnMob(i):updateEnmity(target);
            GetMobByID(i):setPos(mob:getXPos()+1, mob:getYPos(), mob:getZPos()+1); -- Set stray x and z position +1 from Recepticle
            return;
         end
      end
   elseif (mob:getBattleTime() % 30 < 3 and mob:getBattleTime() > 3 and (Mem_Recep == 16842839 or Mem_Recep == 16842846 or Mem_Recep == 16842853 or -- Floor 2
    Mem_Recep == 16842860) and mob:AnimationSub() == 2) then
      for i = Mem_Recep+1, Mem_Recep+5 do
         if (GetMobAction(i) == 0) then
                 mob:AnimationSub(1);
            SpawnMob(i):updateEnmity(target);
            GetMobByID(i):setPos(mob:getXPos()+1, mob:getYPos(), mob:getZPos()+1); -- Set stray x and z position +1 from Recepticle
            return;
         end
      end
   elseif (mob:getBattleTime() % 30 < 3 and mob:getBattleTime() > 3 and (Mem_Recep == 16842886 or Mem_Recep == 16842895 or Mem_Recep == 16842904 or -- Floor 3
    Mem_Recep == 16842938 or Mem_Recep == 16842947 or Mem_Recep == 16842956) and mob:AnimationSub() == 2) then
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
    -- print(mob:getID);

    mob:AnimationSub(0); -- Set ani. sub to default or the recepticles wont work properly

    if (VanadielMinute() % 2 == 1) then
        player:setVar("MemoryReceptacle",2);
        rnd = 2;
    else
        player:setVar("MemoryReceptacle",1);
        rnd = 1;
    end
        switch (mob:getID()) : caseof {
        [16842781] = function (x)
        GetNPCByID(16843057):openDoor(180);
            if (Distance <4 and killeranimation == 0) then
              player:startEvent(0x0025);
            end
        end,
        [16842839] = function (x)
        GetNPCByID(16843053):openDoor(180);
            if (Distance <4 and killeranimation == 0) then
                if (rnd == 2) then
                    player:startEvent(0x0021);
                else
                    player:startEvent(0x0022);
                end
            end
        end,
        [16842846] = function (x)
        GetNPCByID(16843054):openDoor(180);
            if (Distance <4 and killeranimation == 0) then
                if (rnd == 2) then
                    player:startEvent(0x0021);
                else
                    player:startEvent(0x0022);
                end
            end
        end,
        [16842860] = function (x)
        GetNPCByID(16843056):openDoor(180);
            if (Distance <4 and killeranimation == 0) then
                if (rnd == 2) then
                    player:startEvent(0x0021);
                else
                    player:startEvent(0x0022);
                end
            end
        end,
        [16842853] = function (x)
        GetNPCByID(16843055):openDoor(180);
            if (Distance <4 and killeranimation == 0) then
                if (rnd == 2) then
                    player:startEvent(0x0021);
                else
                    player:startEvent(0x0022);
                end
            end
        end,
        [16842886] = function (x)
        GetNPCByID(16843050):openDoor(180);
            if (Distance <4 and killeranimation == 0) then
            player:startEvent(0x001E);
            end
        end,
        [16842895] = function (x)
        GetNPCByID(16843051):openDoor(180);
            if (Distance <4 and killeranimation == 0) then
            player:startEvent(0x001E);
            end
        end,
        [16842904] = function (x)
        GetNPCByID(16843052):openDoor(180);
            if (Distance <4 and killeranimation == 0) then
            player:startEvent(0x001E)
            end
        end,
        [16842938] = function (x)
        GetNPCByID(16843058):openDoor(180);
            if (Distance <4 and killeranimation == 0) then
            player:startEvent(0x001E);
            end
        end,
        [16842947] = function (x)
        GetNPCByID(16843059):openDoor(180);
            if (Distance <4 and killeranimation == 0) then
            player:startEvent(0x001E);
            end
        end,
        [16842956] = function (x)
        GetNPCByID(16843060):openDoor(180);
            if (Distance <4 and killeranimation == 0) then
            player:startEvent(0x001E);
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


