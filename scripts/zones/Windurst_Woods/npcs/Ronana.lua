-----------------------------------
-- Area: Windurst Woods
--  NPC: Ronana
-- Type: Bonecraft Image Support
-- @pos -1.540 -6.25 -144.517 241
-----------------------------------
package.loaded["scripts/zones/Windurst_Woods/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/status");
require("scripts/globals/crafting");
require("scripts/zones/Windurst_Woods/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    local guildMember = isGuildMember(player,2);
    local SkillCap = getCraftSkillCap(player,SKILL_BONECRAFT);
    local SkillLevel = player:getSkillLevel(SKILL_BONECRAFT);

    if (guildMember == 1) then
        if (player:hasStatusEffect(EFFECT_BONECRAFT_IMAGERY) == false) then
            player:startEvent(0x2723,SkillCap,SkillLevel,1,511,player:getGil(),0,36408,0);
        else
            player:startEvent(0x2723,SkillCap,SkillLevel,1,511,player:getGil(),7081,36408,0);
        end
    else
        player:startEvent(0x2723); -- Standard Dialogue
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
    if (csid == 0x2723 and option == 1) then
        player:messageSpecial(IMAGE_SUPPORT,0,6,1);
        player:addStatusEffect(EFFECT_BONECRAFT_IMAGERY,1,0,120);
    end
end;