-----------------------------------
-- Area: Northern San d'Oria
--  NPC: Cheupirudaux
-- Type: Woodworking Guildmaster NPC
-- Involved in Quest: It's Raining Mannequins!
-- @pos -138 12 250 231
-----------------------------------
package.loaded["scripts/zones/Northern_San_dOria/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Northern_San_dOria/TextIDs");
require("scripts/globals/crafting");
require("scripts/globals/status");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    local newRank = tradeTestItem(player,npc,trade,SKILL_WOODWORKING);

    if (newRank ~= 0) then
        player:setSkillRank(SKILL_WOODWORKING,newRank);
        player:startEvent(0x026e,0,0,0,0,newRank);
    end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    local getNewRank = 0;
    local craftSkill = player:getSkillLevel(SKILL_WOODWORKING);
    local testItem = getTestItem(player,npc,SKILL_WOODWORKING);
    local guildMember = isGuildMember(player,9);
    if (guildMember == 1) then guildMember = 150995375; end
    if (canGetNewRank(player,craftSkill,SKILL_WOODWORKING) == 1) then getNewRank = 100; end

    player:startEvent(0x026d,testItem,getNewRank,30,guildMember,44,0,0,0);
end;

-- 0x026d  0x026e  0x02f7  0x0010  0x0000

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
    if (csid == 0x026d and option == 1) then
        if (player:getFreeSlotsCount() == 0) then
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,4098);
        else
            player:addItem(4098);
            player:messageSpecial(ITEM_OBTAINED,4098); -- Wind Crystal
            signupGuild(player, guild.woodworking);
        end
    end
end;