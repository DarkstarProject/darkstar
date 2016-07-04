-----------------------------------
-- Area: Cloister of Gales
--  MOB: Ogmios
-- Involved in Quest: Carbuncle Debacle
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/keyitems");

-----------------------------------
-- OnMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- OnMobDeath Action
-----------------------------------

function onMobDeath(mob, player, isKiller)

    player:setVar("BCNM_Killed",1);
    record = 300;
    partyMembers = 6;
    pZone = player:getZoneID();

    player:startEvent(0x7d01,0,record,0,(os.time() - player:getVar("BCNM_Timer")),partyMembers,0,0);

end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
    -- printf("onUpdate CSID: %u",csid);
    -- printf("onUpdate RESULT: %u",option);

    if (csid == 0x7d01) then
        player:delStatusEffect(EFFECT_BATTLEFIELD);
    end

end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
    -- printf("onFinish CSID: %u",csid);
    -- printf("onFinish RESULT: %u",option);

    if (csid == 0x7d01) then
        player:delKeyItem(DAZEBREAKER_CHARM);
    end

end;
