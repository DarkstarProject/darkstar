-----------------------------------
-- Area: Metalworks
--  NPC: Wise Owl
-- Type: Smithing Adv. Image Support
-- !pos -106.336 2.000 26.117 237
-----------------------------------
package.loaded["scripts/zones/Metalworks/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/status");
require("scripts/globals/crafting");
require("scripts/zones/Metalworks/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    local guildMember = isGuildMember(player,8);
    local SkillLevel = player:getSkillLevel(SKILL_SMITHING);
    local Cost = getAdvImageSupportCost(player,SKILL_SMITHING);

    if (guildMember == 1) then
        if (player:hasStatusEffect(EFFECT_SMITHING_IMAGERY) == false) then
            player:startEvent(103,Cost,SkillLevel,0,207,player:getGil(),0,4095,0);
        else
            player:startEvent(103,Cost,SkillLevel,0,207,player:getGil(),28721,4095,0);
        end
    else
        player:startEvent(103); -- Standard Dialogue
    end
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    local Cost = getAdvImageSupportCost(player,SKILL_SMITHING);

    if (csid == 103 and option == 1) then
        player:delGil(Cost);
        player:messageSpecial(SMITHING_SUPPORT,0,2,0);
        player:addStatusEffect(EFFECT_SMITHING_IMAGERY,3,0,480);
    end
end;
