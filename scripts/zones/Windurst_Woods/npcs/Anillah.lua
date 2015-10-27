-----------------------------------
-- Area: Windurst Woods
--  NPC: Anillah
-- Type: Clothcraft Image Support
-- @pos -34.800 -2.25 -119.950 241
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
    local guildMember = isGuildMember(player,3);
    local SkillCap = getCraftSkillCap(player,SKILL_CLOTHCRAFT);
    local SkillLevel = player:getSkillLevel(SKILL_CLOTHCRAFT);

    if (guildMember == 1) then
        if (player:hasStatusEffect(EFFECT_CLOTHCRAFT_IMAGERY) == false) then
            player:startEvent(0x271F,SkillCap,SkillLevel,2,511,player:getGil(),0,0,0); -- p1 = skill level
        else
            player:startEvent(0x271F,SkillCap,SkillLevel,2,511,player:getGil(),7108,0,0);
        end
    else
        player:startEvent(0x271F); -- Standard Dialogue
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
    if (csid == 0x271F and option == 1) then
        player:messageSpecial(IMAGE_SUPPORT,0,4,2);
        player:addStatusEffect(EFFECT_CLOTHCRAFT_IMAGERY,1,0,120);
    end
end;