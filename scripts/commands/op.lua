---------------------------------------------------------------------------------------------------
-- func: @op <destination> <player>
-- auth: Demolish
-- Modified by: TeoTwawki
-- desc: Warps GM or target player to a given outpost.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "ss"
};

function onTrigger(player,op,target)
    -- Validate an Outpost was given
    if (op == nil) then
        player:PrintToPlayer( string.format( "Invalid Region Name of Outpost '%s' given.", op ) );
        return;
    end
    -- Validate the target..
    if (target == nil) then
        target = player:getName();
    end

    local targ = GetPlayerByName( target );
    if (targ ~= nil) then
    -- Parse Outposts
        if(op == "ronfa" or op == "Ronfa" or op == "ronfaure" or op == "Ronfaure") then
            targ:setPos(-445,-19,-220,0,100);
        elseif(op == "gusta" or op == "Gusta" or op == "gustaberg" or op == "Gustaberg") then
            targ:setPos(-579,40,60,192,106);
        elseif(op == "saruta" or op == "Saruta" or op == "sarutabaruta" or op == "Sarutabaruta") then
            targ:setPos(-15,-12,318,128,115);
        elseif(op == "jugner" or op == "Jugner" or op == "norvallen" or op == "Norvallen") then
            targ:setPos(62,0,-1,67,104);
        elseif(op == "pashow" or op == "Pashow" or op == "derflands" or op == "derfland" or op == "Derfland") then
            targ:setPos(465,24,422,29,109);
        elseif(op == "meriphataud" or op == "Meriphataud" or op == "aragoneu" or op == "Aragoneu") then
            targ:setPos(-298,17,418,98,119);
        elseif(op == "valkurm" or op == "Valkurm" or op == "dunes" or op == "Dunes" or op == "zulkheim" or op == "Zulkheim") then
            targ:setPos(149,-7,94,154,103);
        elseif(op == "bubu" or op == "Bubu" or op == "buburimu" or op == "Buburimu" or op == "kolshushu" or op == "Kolshushu") then
            targ:setPos(-480,-30,57,62,118);
        elseif(op == "qufim" or op == "Qufim") then
            targ:setPos(-246,-19,301,0,126);
        elseif(op == "glacier" or op == "Glacier" or op == "beaucedine" or op == "Beaucedine" or op == "fauregandi" or op == "Fauregandi") then
            targ:setPos(-18,-59,-108,100,111);
        elseif(op == "xarc" or op == "Xarc" or op == "xarcabard" or op == "Xarcabard" or op == "Valdeaunie" or op == "Valdeaunie") then
            targ:setPos(208,-23,-201,24,112);
        elseif(op == "zitah" or op == "ZiTah" or op == "litelor" or op == "LiTelor") then
            targ:setPos(-38,1,-140,69,121);
        elseif(op == "altepa" or op == "Altepa" or op == "altep" or op == "Altep" or op == "kuzotz" or op == "Kuzotz") then
            targ:setPos(-253,8,-252,0,114);
        elseif(op == "teriggan" or op == "Teriggan" or op == "vollbow" or op == "Vollbow") then
            targ:setPos(-184,7,-66,0,113);
        elseif(op == "kazham" or op == "Kazham" or op == "kaz" or op == "Kaz" or op == "elshimolow" or op == "ElshimowLow" or op == "yuhtunga" or op == "Yuhtunga") then
            targ:setPos(-243,0,-400,196,123);
        elseif(op == "elshimohigh" or op == "ElshimowHigh" or op == "yhoator" or op == "Yhoator") then
            targ:setPos(201,0,-82,36,124);
        elseif(op == "safehold" or op == "Safehold" or op == "tavnazia" or op == "Tavnazia") then
            targ:setPos(-544,-5,-55,57,24);
        elseif(op == "sky" or op == "Sky" or op == "tulia" or op == "TuLia") then
            targ:setPos(4,-54,-600,192,130);
        elseif(op == "tavnazia" or op == "Tavnazia") then
            targ:setPos(-544,-5,-55,57,24);
        end
    else
        player:PrintToPlayer( string.format( "Player named '%s' not found!", target ) );
    end
end;