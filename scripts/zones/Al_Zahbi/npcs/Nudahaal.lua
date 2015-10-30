-----------------------------------
-- Area: Al Zahbi
--  NPC: Nudahaal
-- Type: Bonecraft Normal/Adv. Image Support
-- @pos -57.056 -7 -88.377 48
-----------------------------------
package.loaded["scripts/zones/Al_Zahbi/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/status");
require("scripts/globals/crafting");
require("scripts/zones/Al_Zahbi/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    local guildMember = isGuildMember(player,2);

    if (guildMember == 1) then
        if (trade:hasItemQty(2184,1) and trade:getItemCount() == 1) then
            if (player:hasStatusEffect(EFFECT_BONECRAFT_IMAGERY) == false) then
                player:tradeComplete();
                player:startEvent(0x00E1,8,0,0,0,188,0,6,0);
            else
                npc:showText(npc, IMAGE_SUPPORT_ACTIVE);
            end
        end
    end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    local guildMember = isGuildMember(player,2);
    local SkillLevel = player:getSkillLevel(SKILL_BONECRAFT);

    if (guildMember == 1) then
        if (player:hasStatusEffect(EFFECT_BONECRAFT_IMAGERY) == false) then
            player:startEvent(0x00E0,8,SkillLevel,0,511,188,0,6,2184);
        else
            player:startEvent(0x00E0,8,SkillLevel,0,511,188,7121,6,2184);
        end
    else
        player:startEvent(0x00E0,0,0,0,0,0,0,6,0); -- Standard Dialogue
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
    if (csid == 0x00E0 and option == 1) then
        player:messageSpecial(IMAGE_SUPPORT,0,6,1);
        player:addStatusEffect(EFFECT_BONECRAFT_IMAGERY,1,0,120);
    elseif (csid == 0x00E1) then
        player:messageSpecial(IMAGE_SUPPORT,0,6,0);
        player:addStatusEffect(EFFECT_BONECRAFT_IMAGERY,3,0,480);
    end
end;