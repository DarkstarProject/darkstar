-----------------------------------
-- Area: Tavnazian Safehold
--  NPC: Meret
-- !pos 83.166 -25.082 4.633 26
-----------------------------------
require("scripts/globals/keyitems")
require("scripts/globals/missions")
require("scripts/globals/npc_util")
require("scripts/globals/quests")
-----------------------------------

-- [tradedItemId] = rewardItemId
local trades =
{
    [1783] =  5410, -- Luminion Tissue      -> Virtue Stone Pouch
    [1784] =  5410, -- Phuabo Organ         -> Virtue Stone Pouch
    [1785] =  5410, -- Xzomit Organ         -> Virtue Stone Pouch
    [1786] =  5410, -- Aern Organ           -> Virtue Stone Pouch
    [1787] =  5410, -- Hpemde Organ         -> Virtue Stone Pouch
    [1788] =  5410, -- Yovra Organ          -> Virtue Stone Pouch
    [1818] =  5410, -- Euvhi Organ          -> Virtue Stone Pouch
    [1819] =  5410, -- Luminion Chip        -> Virtue Stone Pouch
    [1901] = 15471, -- Vice of Antipathy    -> Merciful Cape
    [1902] = 15472, -- Vice of Avarice      -> Altruistic Cape
    [1903] = 15473, -- Vice of Aspersion    -> Astute Cape
    [1911] = 14808, -- Aura of Adulation    -> Novio Earring
    [1912] = 14809, -- Aura of Voracity     -> Novia Earring
    [1913] = 15458, -- Sin of Indignation   -> Ninurta's Sash
    [1914] = 18245, -- Sin of Indolence     -> Aureole
    [1915] = 17810, -- Sin of Indulgence    -> Futsuno Mitama
    [1916] = 18398, -- Sin of Invidiousness -> Raphael Rod
    [1917] = 15548, -- Sin of Insolence     -> Mars Ring
    [1918] = 15549, -- Sin of Infatuation   -> Bellona Ring
    [1919] = 15550, -- Sin of Intemperance  -> Minerva Ring
}

function onTrade(player, npc, trade)
    if player:getQuestStatus(OTHER_AREAS_LOG, dsp.quest.id.otherAreas.IN_THE_NAME_OF_SCIENCE) == QUEST_COMPLETED then
        for k, v in pairs(trades) do
            if npcUtil.tradeHasExactly(trade, k) then
                player:setLocalVar("meretReward", v)
                player:startEvent(586, k, v)
                break
            end
        end
    end
end

function onTrigger(player, npc)
    if player:getCurrentMission(COP) > dsp.mission.id.cop.THE_WARRIOR_S_PATH then
        if player:getQuestStatus(OTHER_AREAS_LOG, dsp.quest.id.otherAreas.IN_THE_NAME_OF_SCIENCE) == QUEST_COMPLETED then
            if math.random() < 0.5 then
                player:startEvent(582)
            else
                player:startEvent(583)
            end
        else
            player:startEvent(585)
        end
    else
        player:startEvent(584)
    end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
    if csid == 586 and option == player:getLocalVar("meretReward") then
        player:setLocalVar("meretReward", 0)

        if npcUtil.giveItem(player, option) then
            player:confirmTrade()
        end
    end
end
