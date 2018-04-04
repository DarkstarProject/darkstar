-----------------------------------
-- Area: Port Windurst
--  NPC: Panja-Nanja
-- Type: Fishing Adv. Image Support
-- !pos -194.499 -3 58.692 240
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
    local guildMember = isGuildMember(player,8);
    local SkillLevel = player:getSkillLevel(SKILL_FISHING);
    local Cost = getAdvImageSupportCost(player,SKILL_FISHING);

    if (guildMember == 1) then
        if (player:hasStatusEffect(dsp.effects.FISHING_IMAGERY) == false) then
            player:startEvent(10011,Cost,SkillLevel,0,239,player:getGil(),0,0,0); -- p1 = skill level
        else
            player:startEvent(10011,Cost,SkillLevel,0,239,player:getGil(),38586,30,0);
        end
    else
        player:startEvent(10011); -- Standard Dialogue, incorrect
    end
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    local Cost = getAdvImageSupportCost(player,256);

    if (csid == 10011 and option == 1) then
        player:delGil(Cost);
        player:messageSpecial(FISHING_SUPPORT,0,0,0);
        player:addStatusEffect(dsp.effects.FISHING_IMAGERY,2,0,7200);
    end
end;