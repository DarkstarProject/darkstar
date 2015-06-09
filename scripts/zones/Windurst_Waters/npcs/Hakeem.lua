-----------------------------------
-- Area: Windurst Waters
--  NPC: Hakeem
-- Type: Cooking Image Support
-- @pos -123.120 -2.999 65.472 238
-----------------------------------
package.loaded["scripts/zones/Windurst_Waters/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/status");
require("scripts/globals/crafting");
require("scripts/zones/Windurst_Waters/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    local guildMember = isGuildMember(player,4);
    local SkillCap = getCraftSkillCap(player,SKILL_COOKING);
    local SkillLevel = player:getSkillLevel(SKILL_COOKING);

    if (guildMember == 1) then
        if (player:hasStatusEffect(EFFECT_COOKING_IMAGERY) == false) then
            player:startEvent(0x2721,SkillCap,SkillLevel,2,495,player:getGil(),0,4095,0); -- p1 = skill level
        else
            player:startEvent(0x2721,SkillCap,SkillLevel,2,495,player:getGil(),7094,4095,0);
        end
    else
        player:startEvent(0x2721); -- Standard Dialogue
    end
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid == 0x2721 and option == 1) then
        player:messageSpecial(COOKING_SUPPORT,0,8,2);
        player:addStatusEffect(EFFECT_COOKING_IMAGERY,1,0,120);
    end
end;