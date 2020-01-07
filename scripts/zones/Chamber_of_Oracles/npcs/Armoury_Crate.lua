-----------------------------------
-- Area: Chamber of Oracles
--  NPC: Armoury Crate
-------------------------------------
require("scripts/globals/battlefield")
require("scripts/globals/bcnm")
-------------------------------------

local loot =
{
    -- BCNM Legion XI Comitatensis
    [193] =
    {
        {
            {itemid =     0, droprate =  100}, -- nothing
            {itemid = 13148, droprate =  150}, -- evasion_torque
            {itemid = 13149, droprate =  150}, -- parrying_torque
            {itemid = 13151, droprate =  150}, -- guarding_torque
            {itemid = 13159, droprate =  150}, -- ninjutsu_torque
            {itemid = 13161, droprate =  150}, -- wind_torque
            {itemid = 13158, droprate =  150}, -- summoning_torque
        },
        {
            {itemid =     0, droprate =  100}, -- nothing
            {itemid = 13152, droprate =  150}, -- divine_torque
            {itemid = 13153, droprate =  150}, -- dark_torque
            {itemid = 13154, droprate =  150}, -- enhancing_torque
            {itemid = 13155, droprate =  150}, -- enfeebling_torque
            {itemid = 13156, droprate =  150}, -- elemental_torque
            {itemid = 13157, droprate =  150}, -- healing_torque
        },
        {
            {itemid =   803, droprate =  100}, -- sunstone
            {itemid =   737, droprate =  100}, -- chunk_of_gold_ore
            {itemid =   784, droprate =  100}, -- jadeite
            {itemid =   810, droprate =  100}, -- fluorite
            {itemid =   654, droprate =  100}, -- darksteel_ingot
            {itemid =   805, droprate =  100}, -- zircon
            {itemid =   801, droprate =  100}, -- chrysoberyl
            {itemid =   802, droprate =  100}, -- moonstone
            {itemid =   797, droprate =  100}, -- painite
            {itemid =   652, droprate =  100}, -- steel_ingot
        },
        {
            {itemid =     0, droprate =  500}, -- nothing
            {itemid =  4621, droprate =  500}, -- scroll_of_raise_ii
        },
        {
            {itemid =     0, droprate =  950}, -- nothing
            {itemid =  4175, droprate =   50}, -- vile_elixir_+1
        },
        {
            {itemid =   771, droprate =   50}, -- yellow_rock
            {itemid =   776, droprate =   50}, -- white_rock
            {itemid =   702, droprate =  125}, -- ebony_log
            {itemid =   751, droprate =  775}, -- platinum_beastcoin
        },
        {
            {itemid =     0, droprate =  600}, -- nothing
            {itemid =  1260, droprate =   50}, -- chunk_of_water_ore
            {itemid =  1256, droprate =   50}, -- chunk_of_ice_ore
            {itemid =  1259, droprate =   50}, -- chunk_of_lightning_ore
            {itemid =  1258, droprate =   50}, -- chunk_of_earth_ore
            {itemid =  1255, droprate =   50}, -- chunk_of_fire_ore
            {itemid =  1261, droprate =   50}, -- chunk_of_light_ore
            {itemid =  1262, droprate =   50}, -- chunk_of_dark_ore
            {itemid =  1257, droprate =   50}, -- chunk_of_wind_ore
        },
    },
}

function onTrade(player,npc,trade)
end

function onTrigger(player,npc)
    local battlefield = player:getBattlefield()
    if battlefield then
        dsp.battlefield.HandleLootRolls(battlefield, loot[battlefield:getID()], nil, npc)
    end
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end
