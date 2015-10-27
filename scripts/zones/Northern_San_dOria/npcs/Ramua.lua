-----------------------------------
-- Area: Northern San d'Oria
--  NPC: Ramua
-- Type: Woodworking Synthesis Image Support
-- @pos -183.750 10.999 255.770 231
-----------------------------------
package.loaded["scripts/zones/Northern_San_dOria/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/status");
require("scripts/globals/crafting");
require("scripts/zones/Northern_San_dOria/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    local guildMember = isGuildMember(player,9);
    local SkillCap = getCraftSkillCap(player,SKILL_WOODWORKING);
    local SkillLevel = player:getSkillLevel(SKILL_WOODWORKING);

    if (guildMember == 1) then
        if (player:hasStatusEffect(EFFECT_WOODWORKING_IMAGERY) == false) then
            player:startEvent(0x0271,SkillCap,SkillLevel,2,207,player:getGil(),0,0,0);
        else
            player:startEvent(0x0271,SkillCap,SkillLevel,2,207,player:getGil(),6857,0,0);
        end
    else
        player:startEvent(0x0271,SkillCap,SkillLevel,2,201,player:getGil(),0,0,0); -- Standard Dialogue
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
    if (csid == 0x0271 and option == 1) then
        player:messageSpecial(IMAGE_SUPPORT,0,1,2);
        player:addStatusEffect(EFFECT_WOODWORKING_IMAGERY,1,0,120);
    end
end;