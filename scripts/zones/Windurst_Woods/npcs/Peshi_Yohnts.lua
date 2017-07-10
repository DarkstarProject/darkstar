-----------------------------------
-- Area: Windurst Woods
--  NPC: Peshi Yohnts
-- Type: Bonecraft Guild Master
-- @pos -6.175 -6.249 -144.667 241
-----------------------------------
package.loaded["scripts/zones/Windurst_Woods/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Windurst_Woods/TextIDs");
require("scripts/globals/crafting");
require("scripts/globals/status");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    local newRank = tradeTestItem(player,npc,trade,SKILL_BONECRAFT);

    if (newRank ~= 0) then
        player:setSkillRank(SKILL_BONECRAFT,newRank);
        player:startEvent(0x2721,0,0,0,0,newRank);
    end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    local getNewRank = 0;
    local craftSkill = player:getSkillLevel(SKILL_BONECRAFT);
    local testItem = getTestItem(player,npc,SKILL_BONECRAFT);
    local guildMember = isGuildMember(player,2);
    if (guildMember == 1) then guildMember = 64; end
    if (canGetNewRank(player,craftSkill,SKILL_BONECRAFT) == 1) then getNewRank = 100; end

    player:startEvent(0x2720,testItem,getNewRank,30,guildMember,44,0,0,0);
end;

-- 0x2720  0x2721  0x02c6  0x02c7  0x02c8  0x02c9  0x02ca  0x02cb  0x02fc

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
    if (csid == 0x2720 and option == 1) then
        local crystal = 4098; -- wind crystal

        if (player:getFreeSlotsCount() == 0) then
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,crystal);
        else
            player:addItem(crystal);
            player:messageSpecial(ITEM_OBTAINED,crystal);
            signupGuild(player, guild.bonecraft);
        end
    end
end;