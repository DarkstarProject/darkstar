-----------------------------------
-- Area: Northern San d'Oria
--  NPC: Ulycille
-- Type: Woodworking Adv. Synthesis Image Support
-- @pos -183.320 9.999 269.651 231
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
    local SkillLevel = player:getSkillLevel(SKILL_WOODWORKING);
    local Cost = getAdvImageSupportCost(player,SKILL_WOODWORKING);
    
    if (guildMember == 1) then
        if (player:hasStatusEffect(EFFECT_WOODWORKING_IMAGERY) == false) then
            player:startEvent(0x026F,Cost,SkillLevel,0,207,player:getGil(),0,4095,0);
        else
            player:startEvent(0x026F,Cost,SkillLevel,0,207,player:getGil(),28482,4095,0);
        end
    else
        player:startEvent(0x026F); -- Standard Dialogue
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
    local Cost = getAdvImageSupportCost(player,SKILL_WOODWORKING);

    if (csid == 0x026F and option == 1) then
        player:delGil(Cost);
        player:messageSpecial(IMAGE_SUPPORT,0,1,0);
        player:addStatusEffect(EFFECT_WOODWORKING_IMAGERY,3,0,480);
    end
end;