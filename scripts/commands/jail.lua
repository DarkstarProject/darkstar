---------------------------------------------------------------------------------------------------
-- func: jail
-- desc: Sends the target player to jail. (Mordion Gaol)
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "sis"
};

function onTrigger(player, target, cellId, reason)
    local jailCells = 
    {
        -- Floor 1 (Bottom)
        {-620, 11,  660, 0},  {-180, 11,  660, 0}, {-260, 11,  660, 0}, {-700, 11,  660, 0},
        {-620, 11,  220, 0},  {-180, 11,  220, 0}, {-260, 11,  220, 0}, {-700, 11,  220, 0},
        {-620, 11, -220, 0},  {-180, 11, -220, 0}, {-260, 11, -220, 0}, {-700, 11, -220, 0},
        {-620, 11, -660, 0},  {-180, 11, -660, 0}, {-260, 11, -660, 0}, {-700, 11, -660, 0},

        -- Floor 2 (Top)
        {-620, -440,  660, 0},  {-180, -440,  660, 0}, {-260, -440,  660, 0}, {-700, -440,  660, 0},
        {-620, -440,  220, 0},  {-180, -440,  220, 0}, {-260, -440,  220, 0}, {-700, -440,  220, 0},
        {-620, -440, -220, 0},  {-180, -440, -220, 0}, {-260, -440, -220, 0}, {-700, -440, -220, 0},
        {-620, -440, -660, 0},  {-180, -440, -660, 0}, {-260, -440, -660, 0}, {-700, -440, -660, 0},
    };

    -- Validate the target..
    local targ = GetPlayerByName( target );
    if (targ == nil) then
        player:PrintToPlayer( string.format( "Invalid player '%s' given.", target ) );
        return;
    end

    -- Validate the cell id..
    if (cellId == nil or cellId == 0 or cellId > 32) then
        cellId = 1;
    end
    
    -- Validate the reason..
    if (reason == nil) then
        reason = "Unspecified.";
    end

    -- Print that we have jailed someone..
    local message = string.format( '%s jailed %s(%d) into cell %d. Reason: %s', player:getName(), target, targ:getID(), cellId, reason );
    printf( message );

    -- Send the target to jail..
    local dest = jailCells[ cellId ];
    targ:setVar( "inJail", cellId );
    targ:setPos( dest[1], dest[2], dest[3], dest[4], 131 );
end