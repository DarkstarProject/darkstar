-----------------------------------
-- Area: Port Windurst
--  NPC: Degong
-- Type: Fishing Synthesis Image Support
-- !pos -178.400 -3.835 60.480 240
-----------------------------------
package.loaded["scripts/zones/Port_Windurst/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/status");
require("scripts/globals/crafting");
require("scripts/zones/Port_Windurst/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    local guildMember = isGuildMember(player,5);
    local SkillCap = getCraftSkillCap(player,SKILL_FISHING);
    local SkillLevel = player:getSkillLevel(SKILL_FISHING);

    if (guildMember == 1) then
        if (player:hasStatusEffect(EFFECT_FISHING_IMAGERY) == false) then
            player:startEvent(10013,SkillCap,SkillLevel,2,239,player:getGil(),0,30,0); -- p1 = skill level
        else
            player:startEvent(10013,SkillCap,SkillLevel,2,239,player:getGil(),19293,30,0);
        end
    else
        player:startEvent(10013); -- Standard Dialogue
    end
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid == 10013 and option == 1) then
        player:messageSpecial(FISHING_SUPPORT,0,0,2);
        player:addStatusEffect(EFFECT_FISHING_IMAGERY,1,0,3600);
    end
end;