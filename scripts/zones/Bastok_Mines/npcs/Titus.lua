-----------------------------------
-- Area: Bastok Mines
--  NPC: Titus
-- Alchemy Synthesis Image Support
-----------------------------------
package.loaded["scripts/zones/Bastok_Mines/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/status");
require("scripts/globals/crafting");
require("scripts/zones/Bastok_Mines/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    local guildMember = isGuildMember(player,1);
    local SkillCap = getCraftSkillCap(player,SKILL_ALCHEMY);
    local SkillLevel = player:getSkillLevel(SKILL_ALCHEMY);
    
    if (guildMember == 1) then
        if (player:hasStatusEffect(EFFECT_ALCHEMY_IMAGERY) == false) then
            player:startEvent(0x007B,SkillCap,SkillLevel,1,137,player:getGil(),0,0,0);
        else
            player:startEvent(0x007B,SkillCap,SkillLevel,1,137,player:getGil(),6758,0,0);
        end
    else
        player:startEvent(0x007B);
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
    if (csid == 0x007B and option == 1) then
        player:messageSpecial(ALCHEMY_SUPPORT,0,7,1);
        player:addStatusEffect(EFFECT_ALCHEMY_IMAGERY,1,0,120);
    end
end;