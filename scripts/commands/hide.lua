---------------------------------------------------------------------------------------------------
-- func: hide
-- auth: atom0s
-- desc: Hides the GM from other players.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "s"
};

function onTrigger(player, cmd)
    -- Obtain the players hide status..
    local isHidden = player:getGMHidden();
    if (cmd ~= nil) then
        if (cmd == "status") then
            player:PrintToPlayer(string.format('Current hide status: %s', tostring(isHidden)));
            return;
        end
    end

    -- Toggle the hide status..
    if (isHidden == false) then 
        isHidden = true;
    else
        isHidden = false;
    end
    
    -- If hidden animate us beginning our hide..
    if (isHidden == true) then        
        player:injectActionPacket( 6, 229 );
        player:injectActionPacket( 6, 10 );
        player:injectActionPacket( 6, 16 );
        player:injectActionPacket( 6, 300 );
        player:setGMHidden( isHidden );
        player:PrintToPlayer( "You are now GM hidden from other players." );
    else
        player:setGMHidden( isHidden );
        player:PrintToPlayer( "You are no longer GM hidden from other players." );
    end
end