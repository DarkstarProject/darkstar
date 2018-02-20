-----------------------------------
-- Area: Windurst Woods
--  NPC: Terude-Harude
-- Type: Clothcraft Adv. Image Support
-- !pos -32.350 -2.679 -116.450 241
-----------------------------------
package.loaded["scripts/zones/Windurst_Woods/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/status");
require("scripts/globals/crafting");
require("scripts/zones/Windurst_Woods/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    local guildMember = isGuildMember(player,3);
    local SkillLevel = player:getSkillLevel(SKILL_CLOTHCRAFT);
    local Cost = getAdvImageSupportCost(player,SKILL_CLOTHCRAFT);

    if (guildMember == 1) then
        if (player:hasStatusEffect(EFFECT_CLOTHCRAFT_IMAGERY) == false) then
            player:startEvent(10013,Cost,SkillLevel,0,511,player:getGil(),0,4095,0);
        else
            player:startEvent(10013,Cost,SkillLevel,0,511,player:getGil(),28754,0,0);
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
    local Cost = getAdvImageSupportCost(player,8);
    if (csid == 10013 and option == 1) then
        player:delGil(Cost);
        player:messageSpecial(IMAGE_SUPPORT,0,4,0);
        player:addStatusEffect(EFFECT_CLOTHCRAFT_IMAGERY,3,0,480);
    end
end;