-----------------------------------
-- Area: Northern San d'Oria
--  NPC: Mevreauche
-- Type: Smithing Guild Master
-- @pos -193.584 10 148.655 231
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
    local newRank = tradeTestItem(player,npc,trade,SKILL_SMITHING);

    if (newRank ~= 0) then
        player:setSkillRank(SKILL_SMITHING,newRank);
        player:startEvent(0x0273,0,0,0,0,newRank);
    end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    local getNewRank = 0;
    local craftSkill = player:getSkillLevel(SKILL_SMITHING);
    local testItem = getTestItem(player,npc,SKILL_SMITHING);
    local guildMember = isGuildMember(player,8);
    if (guildMember == 1) then guildMember = 150995375; end
    if (canGetNewRank(player,craftSkill,SKILL_SMITHING) == 1) then getNewRank = 100; end

    player:startEvent(0x0272,testItem,getNewRank,30,guildMember,44,0,0,0);
end;

-- 0x0272  0x0273  0x0010  0x0000  0x0049  0x004a

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
    if (csid == 0x0272 and option == 1) then
        if (player:getFreeSlotsCount() == 0) then
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,4096);
        else
            player:addItem(4096);
            player:messageSpecial(ITEM_OBTAINED,4096); -- Fire Crystal
            signupGuild(player, guild.smithing);
        end
    end
end;