-----------------------------------
-- Area: Port Windurst
--  NPC: Erabu-Fumulubu
-- Type: Fishing Synthesis Image Support
-- @pos -178.900 -2.789 76.200 240
-----------------------------------
package.loaded["scripts/zones/Port_Windurst/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/status");
require("scripts/globals/crafting");
require("scripts/zones/Port_Windurst/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    local guildMember = isGuildMember(player,5);
    local SkillCap = getCraftSkillCap(player,SKILL_FISHING);
    local SkillLevel = player:getSkillLevel(SKILL_FISHING);

    if (guildMember == 1) then
        if (player:hasStatusEffect(EFFECT_FISHING_IMAGERY) == false) then
            player:startEvent(0x271C,SkillCap,SkillLevel,1,239,player:getGil(),0,0,0); -- p1 = skill level
        else
            player:startEvent(0x271C,SkillCap,SkillLevel,1,239,player:getGil(),19194,4031,0);
        end
    else
        player:startEvent(0x271C); -- Standard Dialogue
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
    if (csid == 0x271C and option == 1) then
        player:messageSpecial(FISHING_SUPPORT,0,0,1);
        player:addStatusEffect(EFFECT_FISHING_IMAGERY,1,0,3600);
    end
end;