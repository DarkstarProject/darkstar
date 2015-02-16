---------------------------------------------------------------------------------------------------
-- func: @tele <destination> <player>
-- auth: TeoTwawki
-- desc: Warps GM or target player to Tele Crags and select other locations...
---------------------------------------------------------------------------------------------------

cmdprops =
{
    -- Using lv 0 so players can use, KI check still happens below
    permission = 0, 
    parameters = "ss"
};

function onTrigger(player, tele, target)
    -- Require the needed globals...
    require("scripts/globals/status");
    require("scripts/globals/teleports");
    require("scripts/globals/keyitems");

    local gmlvl = player:getGMLevel();

    -- Check that a location was given...
    if (tele == nil) then
        player:PrintToPlayer("You must enter a valid Teleport location.");
        player:PrintToPlayer("@tele <destination> <player>");
        return;
    end

    -- Check if the target was specified and default to self if not...
    if (target == nil or gmlvl == 0) then
        target = player:getName();
    end

    -- And now we check that the target exists and do the teleport if it does.
    local targ = GetPlayerByName( target );
    if (targ ~= nil) then
    -- Parse the Teleports
        if (tele == "dem" or tele == "Dem") then
            if (targ:hasKeyItem(DEM_GATE_CRYSTAL) or gmlvl >= 1) then
                targ:injectActionPacket( 4, 122 );
                targ:addStatusEffectEx(EFFECT_TELEPORT, 0, TELEPORT_DEM, 0, 1);
            end
        elseif (tele == "holla" or tele == "Holla" or tele == "hol" or tele == "Hol") then
            if (targ:hasKeyItem(HOLLA_GATE_CRYSTAL) or gmlvl >= 1) then
                targ:injectActionPacket( 4, 122 );
                targ:addStatusEffectEx(EFFECT_TELEPORT, 0, TELEPORT_HOLLA, 0, 1);
            end
        elseif (tele == "mea" or tele == "Mea") then
            if (targ:hasKeyItem(MEA_GATE_CRYSTAL) or gmlvl >= 1) then
                targ:injectActionPacket( 4, 122 );
                targ:addStatusEffectEx(EFFECT_TELEPORT, 0, TELEPORT_MEA, 0, 1);
            end
        elseif (tele == "vahzl" or tele == "Vahzl" or tele == "vahz" or tele == "Vahz" or tele == "vah" or tele == "Vah") then
            if (targ:hasKeyItem(VAHZL_GATE_CRYSTAL) or gmlvl >= 1) then
                targ:injectActionPacket( 4, 122 );
                targ:addStatusEffectEx(EFFECT_TELEPORT, 0, TELEPORT_VAHZL, 0, 1);
            end
        elseif (tele == "yhoat" or tele == "Yhoat" or tele == "yho" or tele == "Yho") then
            if (targ:hasKeyItem(YHOATOR_GATE_CRYSTAL) or gmlvl >= 1) then
                targ:injectActionPacket( 4, 122 );
                targ:addStatusEffectEx(EFFECT_TELEPORT, 0, TELEPORT_YHOAT, 0, 1);
            end
        elseif (tele == "altep" or tele == "Altep" or tele == "altepa" or tele == "Altepa" or tele == "alt" or tele == "Alt") then
            if (targ:hasKeyItem(ALTEPA_GATE_CRYSTAL) or gmlvl >= 1) then
                targ:injectActionPacket( 4, 122 );
                targ:addStatusEffectEx(EFFECT_TELEPORT, 0, TELEPORT_ALTEP, 0, 1);
            end
        elseif (tele == "jugner" or tele == "Jugner") then
            if (targ:hasKeyItem(JUGNER_GATE_CRYSTAL) or gmlvl >= 1) then
                targ:injectActionPacket( 4, 122 );
                targ:addStatusEffectEx(EFFECT_TELEPORT, 0, RECALL_JUGNER, 0, 1);
            end
        elseif (tele == "pashh" or tele == "Pashh" or tele == "pashow" or tele == "Pashow") then
            if (targ:hasKeyItem(PASHHOW_GATE_CRYSTAL) or gmlvl >= 1) then
                targ:injectActionPacket( 4, 122 );
                targ:addStatusEffectEx(EFFECT_TELEPORT, 0, RECALL_PASHH, 0, 1);
            end
        elseif (tele == "meriph" or tele == "Meriph" or tele == "meriphataud" or tele == "Meriphataud") then
            if (targ:hasKeyItem(MERIPHATAUD_GATE_CRYSTAL) or gmlvl >= 1) then
                targ:injectActionPacket( 4, 122 );
                targ:addStatusEffectEx(EFFECT_TELEPORT, 0, RECALL_MERIPH, 0, 1);
            end

        -- Begin GM onry destinations section.
        elseif (tele == "Jeuno" or tele == "jeuno") then
            if (gmlvl >= 1) then
                targ:setPos(0, 9, -33, 192, 243);
            end
        elseif (tele == "Kazham" or tele == "kazham" or tele == "kaz" or tele == "Kaz") then
            if (gmlvl >= 1) then
                targ:setPos(-29, -2, -14, 62, 250);
            end
        elseif (tele == "Laypoint" or tele == "laypoint" or tele == "Wajaom" or tele == "wajaom") then
            if (gmlvl >= 1) then
                targ:setPos(-200.116, -10, 79.879, 213, 51);
            end
        elseif (tele == "Whitegate" or tele == "whitegate" or tele == "wg") then
            if (gmlvl >= 1) then
                targ:setPos(27.424, -6, -123.792, 192, 0x32);
            end
        elseif (tele == "Sky" or tele == "sky") then
            if (gmlvl >= 1) then
                targ:setPos(-134.145, -32.328, -205.947, 215, 130);
            end
        elseif (tele == "Kirin!") then
            if (gmlvl >= 1) then
                targ:setPos(-79, 32, -1, 192, 178);
            end
        -- End of GM onry section.

        else
            player:PrintToPlayer( string.format( "Invalid Tele location '%s' given.", tele ) );
            player:PrintToPlayer("@tele <destination> <player>");
        end
    else
        player:PrintToPlayer( string.format( "Player named '%s' not found!", target ) );
        player:PrintToPlayer("@tele <destination> <player>");
    end

end;