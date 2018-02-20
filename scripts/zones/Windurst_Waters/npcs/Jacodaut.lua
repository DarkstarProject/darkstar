-----------------------------------
-- Area: Windurst Waters
--  NPC: Jacodaut
-- Type: Cooking Image Support
-- !pos -125.890 -2.999 62.499 238
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
    local SkillCap = getCraftSkillCap(player,SKILL_COOKING);
    local SkillLevel = player:getSkillLevel(SKILL_COOKING);

    if (guildMember == 1) then
        if (player:hasStatusEffect(EFFECT_COOKING_IMAGERY) == false) then
            player:startEvent(10016,SkillCap,SkillLevel,1,495,player:getGil(),0,4095,0); -- p1 = skill level
        else
            player:startEvent(10016,SkillCap,SkillLevel,1,495,player:getGil(),7180,4095,0);
        end
    else
        player:startEvent(10016); -- Standard Dialogue
    end
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid == 10016 and option == 1) then
        player:messageSpecial(COOKING_SUPPORT,0,8,1);
        player:addStatusEffect(EFFECT_COOKING_IMAGERY,1,0,120);
    end
end;