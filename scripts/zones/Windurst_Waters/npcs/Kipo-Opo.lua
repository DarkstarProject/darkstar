-----------------------------------
-- Area: Windurst Waters
--  NPC: Kipo-Opo
-- Type: Cooking Adv. Image Support
-- !pos -119.750 -5.239 64.500 238
-----------------------------------
package.loaded["scripts/zones/Windurst_Waters/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/status");
require("scripts/globals/crafting");
require("scripts/zones/Windurst_Waters/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    local guildMember = isGuildMember(player,4);
    local SkillLevel = player:getSkillLevel(SKILL_COOKING);
    local Cost = getAdvImageSupportCost(player,SKILL_COOKING);

    if (guildMember == 1) then
        if (player:hasStatusEffect(EFFECT_COOKING_IMAGERY) == false) then
            player:startEvent(10015,Cost,SkillLevel,0,495,player:getGil(),0,0,0); -- p1 = skill level
        else
            player:startEvent(10015,Cost,SkillLevel,0,495,player:getGil(),28589,0,0);
        end
    else
        player:startEvent(10015); -- Standard Dialogue
    end
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    local Cost = getAdvImageSupportCost(player,SKILL_COOKING);

    if (csid == 10015 and option == 1) then
        player:delGil(Cost);
        player:messageSpecial(COOKING_SUPPORT,0,8,0);
        player:addStatusEffect(EFFECT_COOKING_IMAGERY,3,0,480);
    end
end;