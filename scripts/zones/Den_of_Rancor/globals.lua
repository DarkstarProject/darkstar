-- Zone: Den of Rancor (160)
-- Desc: this file contains functions that are shared by multiple luas in this zone's directory
-----------------------------------
package.loaded["scripts/zones/Den_of_Rancor/TextIDs"] = nil
-----------------------------------
require("scripts/zones/Den_of_Rancor/TextIDs")
require("scripts/zones/Den_of_Rancor/MobIDs")
require("scripts/globals/npc_util")
require("scripts/globals/settings")
require("scripts/globals/status")
-----------------------------------

DEN_OF_RANCOR = {
    --[[..............................................................................................
        trade to lanterns next to Sacrificial Chamber (Rancor Flame)
        ..............................................................................................]]
    onTradeLanternChamber = function(player, npc, trade)
        if npcUtil.tradeHas(trade, 1139) then -- Rancor Flame
            if npc:getAnimation() == dsp.anim.OPEN_DOOR then
                player:messageSpecial(LANTERN_OFFSET + 7) -- already lit
            else
                player:confirmTrade()
                player:addItem(1138) -- return unlit lantern

                npc:openDoor(LANTERNS_STAY_LIT) -- light lantern

                local total = GetNPCByID(RANCOR_LANTERN_OFFSET + 0):getAnimation() +
                              GetNPCByID(RANCOR_LANTERN_OFFSET + 1):getAnimation() +
                              GetNPCByID(RANCOR_LANTERN_OFFSET + 2):getAnimation() +
                              GetNPCByID(RANCOR_LANTERN_OFFSET + 3):getAnimation()

                player:messageSpecial(LANTERN_OFFSET + 44 - total)
                
                if total == 32 then
                    for i = RANCOR_LANTERN_OFFSET, RANCOR_LANTERN_OFFSET + 3 do
                        local lantern = GetNPCByID(i)
                        lantern:closeDoor(1)
                        lantern:openDoor(30)
                    end
                    GetNPCByID(RANCOR_LANTERN_OFFSET + 4):openDoor(30)
                end
            end
        end
    end,

    --[[..............................................................................................
        trade to lanterns next to Hakutaku (Rancor Flame)
        ..............................................................................................]]
    onTradeLanternHaku = function(player, npc, trade)
        if npcUtil.tradeHas(trade, 1139) then -- Rancor Flame
            if npc:getAnimation() == dsp.anim.OPEN_DOOR then
                player:messageSpecial(LANTERN_OFFSET + 7) -- already lit
            else
                player:confirmTrade()
                player:addItem(1138) -- return unlit lantern

                npc:openDoor(LANTERNS_STAY_LIT) -- light lantern

                local total = GetNPCByID(RANCOR_LANTERN_OFFSET + 6):getAnimation() +
                              GetNPCByID(RANCOR_LANTERN_OFFSET + 7):getAnimation()

                if total == 17 then
                    player:messageSpecial(LANTERN_OFFSET + 9)
                elseif total == 16 then
                    player:messageSpecial(LANTERN_OFFSET + 12)
                    for i = RANCOR_LANTERN_OFFSET + 6, RANCOR_LANTERN_OFFSET + 7 do
                        local lantern = GetNPCByID(i)
                        lantern:closeDoor(1)
                        lantern:openDoor(30)
                    end
                    GetNPCByID(RANCOR_LANTERN_OFFSET + 8):openDoor(30)
                end
            end
        end
    end,

    --[[..............................................................................................
        trade to lanterns next to boss room (Flames of Crimson and Blue Rancor)
        ..............................................................................................]]
    onTradeLanternBoss = function(player, npc, trade)
        local itemId = 1131 + npc:getID() - RANCOR_LANTERN_OFFSET
        
        if npcUtil.tradeHas(trade, itemId) then -- Flame of Crimson or Blue Rancor
            if npc:getAnimation() == dsp.anim.OPEN_DOOR then
                player:messageSpecial(LANTERN_OFFSET + 7) -- already lit
            else
                player:confirmTrade()
                player:addItem(1138) -- return unlit lantern

                npc:openDoor(LANTERNS_STAY_LIT) -- light lantern

                local total = GetNPCByID(RANCOR_LANTERN_OFFSET + 9):getAnimation() +
                              GetNPCByID(RANCOR_LANTERN_OFFSET + 10):getAnimation()

                if total == 17 then
                    player:messageSpecial(LANTERN_OFFSET + 9)
                elseif total == 16 then
                    player:messageSpecial(LANTERN_OFFSET + 12)
                    for i = RANCOR_LANTERN_OFFSET + 9, RANCOR_LANTERN_OFFSET + 10 do
                        local lantern = GetNPCByID(i)
                        lantern:closeDoor(1)
                        lantern:openDoor(30)
                    end
                    GetNPCByID(RANCOR_LANTERN_OFFSET + 11):openDoor(30)
                end
            end
        end
    end,

    onTriggerLantern = function(player, npc)
        if npc:getAnimation() == dsp.anim.OPEN_DOOR then
            player:messageSpecial(LANTERN_OFFSET + 7) -- already lit
        else
            player:messageSpecial(LANTERN_OFFSET + 20) -- unlit
        end
    end,
}

return DEN_OF_RANCOR