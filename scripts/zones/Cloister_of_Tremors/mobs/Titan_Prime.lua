-----------------------------------
-- Area: Cloister of Tremors
--  Mob: Titan Prime
-- Involved in Quest: Trial by Earth
-- Involved in Mission: ASA-4 Sugar Coated Directive
-----------------------------------
local ID = require("scripts/zones/Cloister_of_Tremors/IDs")
require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/status");
-----------------------------------

function onMobFight(mob, target)
    local mobId = mob:getID();

    -- ASA-4: Astral Flow Behavior - Guaranteed to Use At Least 5 times before killable, at specified intervals.
    if (mob:getBattlefield():getBcnmID() == 580 and mob:getCurrentAction() == dsp.act.ATTACK) then
        local astralFlows = mob:getLocalVar("astralflows");
        if ((astralFlows == 0 and mob:getHPP() <= 80)
        or (astralFlows == 1 and mob:getHPP() <= 60)
        or (astralFlows == 2 and mob:getHPP() <= 40)
        or (astralFlows == 3 and mob:getHPP() <= 20)
        or (astralFlows == 4 and mob:getHPP() <= 1)) then
            mob:setLocalVar("astralflows",astralFlows + 1);
            mob:useMobAbility(857);
            if (astralFlows >= 5) then
                mob:setUnkillable(false);
            end
        end
    end
end;

function onMobSpawn(mob)
    -- ASA-4: Avatar is Unkillable Until Its Used Astral Flow At Least 5 times At Specified Intervals
    if (mob:getBattlefield():getBcnmID() == 580) then
        mob:setLocalVar("astralflows",0);
        mob:setUnkillable(true);
    end
end;

function onMobDeath(mob, player, isKiller)
    if (mob:getBattlefield():getBcnmID()~= 580) then
        player:setVar("BCNM_Killed",1);
        record = 300;
        partyMembers = 6;
        pZone = player:getZone();

        player:startEvent(32001,0,record,0,(os.time() - player:getCharVar("BCNM_Timer")),partyMembers,0,0);
    end
end;

function onEventUpdate(player,csid,option)
    -- printf("onUpdate CSID: %u",csid);
    -- printf("onUpdate RESULT: %u",option);

    if (csid == 32001) then
        player:delStatusEffect(dsp.effect.BATTLEFIELD);
    end

end;

function onEventFinish(player,csid,option)
    -- printf("onFinish CSID: %u",csid);
    -- printf("onFinish RESULT: %u",option);

    if (csid == 32001) then
        player:delKeyItem(dsp.ki.TUNING_FORK_OF_EARTH);
        player:addKeyItem(dsp.ki.WHISPER_OF_TREMORS);
        player:messageSpecial(ID.text.KEYITEM_OBTAINED,dsp.ki.WHISPER_OF_TREMORS);
    end

end;
