----------------------------------------------
-- Global functionality for Ephemeral Moogles
----------------------------------------------
require("scripts/globals/npc_util")
----------------------------------------------

dsp = dsp or {}

dsp.ephemeral = {}

local crystalData =
{
    { item = 4096, param = 1, offset = 2, name = "fire_crystals" }, -- Fire Crystal
    { item = 4097, param = 1, offset = 0, name = "ice_crystals" }, -- Ice Crystal
    { item = 4098, param = 2, offset = 2, name = "wind_crystals" }, -- Wind Crystal
    { item = 4099, param = 2, offset = 0, name = "earth_crystals" }, -- Earth Crystal
    { item = 4100, param = 3, offset = 2, name = "lightning_crystals" }, -- Lightning Crystal
    { item = 4101, param = 3, offset = 0, name = "water_crystals" }, -- Water Crystal
    { item = 4102, param = 4, offset = 2, name = "light_crystals" }, -- Light Crystal
    { item = 4103, param = 4, offset = 0, name = "dark_crystals" }, -- Dark Crystal
}

dsp.ephemeral.onTrade = function(player, trade, event)
    local params = {}
    for _, v in ipairs(crystalData) do
        if npcUtil.tradeHas(trade, v.item) then
            local qty = trade:getItemQty(v.item)
            params[v.param] = bit.bor(params[v.param], bit.lshift(qty, v.offset))
        end
    end
    
    player:startEvent(event, 0, unpack(params))
end

dsp.ephemeral.onTrigger = function(player, event)
    local params = {}
    for _, v in ipairs(crystalData) do
        params[v.param] = bit.bor(param[v.param], bit.lshift(player:getCurrency(v.name), v.offset))
    end

    player:startEvent(event, unpack(params))
end

dsp.ephemeral.onEventFinish = function(player, csid, option)
end