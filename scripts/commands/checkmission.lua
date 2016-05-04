---------------------------------------------------------------------------------------------------
-- func: @checkmission <Log ID> <Player>
-- desc: Prints current MissionID for the given LogID and target Player to the in game chatlog
---------------------------------------------------------------------------------------------------

req

cmdprops =
{
    permission = 1,
    parameters = "ss"
};

function onTrigger(player,logId,target)
    
    logId = tonumber(logId) or _G[logId];
    
    if (logId == nil) then
        player:PrintToPlayer( "You must enter a valid LogID!" );
        player:PrintToPlayer( "@checkmission <Log ID> <Player>" );
        return;
    end

    if (target == nil) then
        target = player:getName();
    end

    local targ = GetPlayerByName(target);
    local Log = targ:getCurrentMission(logId)
    -- Todo: loop through missionIDs and output mission name, not just a number.
    -- Hopefully can use same method to replace this annoying pile of elseif's.
    if (targ ~= nil) then
        if (logId == 12) then    -- Seekers of Adoulin
            player:PrintToPlayer( string.format( "Current Seekers of Adoulin Mission ID is: '%s' !", Log ) );
        elseif (logId == 11) then -- A Shantotto Ascension
            player:PrintToPlayer( string.format( "Current Shantotto Ascension Mission ID is: '%s' !", Log ) );
        elseif (logId == 10) then -- A moogle Kupo d'Etat
            player:PrintToPlayer( string.format( "Current moogle Kupo dEtat Mission ID is: '%s' !", Log ) );
        elseif (logId == 9) then -- A Crystalline Prophecy
            player:PrintToPlayer( string.format( "Current Crystalline Prophecy Mission ID is: '%s' !", Log ) );
        elseif (logId == 8) then -- Campaign
            player:PrintToPlayer( string.format( "Current Campaign OPs ID is: '%s' !", Log ) );
        elseif (logId == 7) then -- Assault
            player:PrintToPlayer( string.format( "Current Assault Mission ID is: '%s' !", Log ) );
        elseif (logId == 6) then -- Chains of Promathia
            player:PrintToPlayer( string.format( "Current Chains of Promathia Mission ID is: '%s' !", Log ) );
        elseif (logId == 5) then -- Wings of the Goddess
            player:PrintToPlayer( string.format( "Current Wings of the Goddess Mission ID is: '%s' !", Log ) );
        elseif (logId == 4) then -- Treasures of Aht Urgan
            player:PrintToPlayer( string.format( "Current Treasures of Aht Urgan Mission ID is: '%s' !", Log ) );
        elseif (logId == 3) then -- Rise of the Zilart
            if (Log == 255) then
                player:PrintToPlayer( "No current Rise of the Zilart mission." );
            else
                player:PrintToPlayer( string.format( "Current Rise of the Zilart Mission ID is: '%s' !", Log ) );
            end
        elseif (logId == 2) then -- Windurst
            if (Log == 255) then
                player:PrintToPlayer( "No current Windurst mission." );
            else
                player:PrintToPlayer( string.format( "Current Windurst Mission ID is: '%s' !", Log ) );
            end
        elseif (logId == 1) then -- Bastok
            if (Log == 255) then
                player:PrintToPlayer( "No current Bastok mission." );
            else
                player:PrintToPlayer( string.format( "Current Bastok Mission ID is: '%s' !", Log ) );
            end
        elseif (logId == 0) then -- San d'Orea
            if (Log == 255) then
                player:PrintToPlayer( "No current San d'Orea mission." );
            else
                player:PrintToPlayer( string.format( "Current San dOrea Mission ID is: '%s' !", Log ) );
            end
        else     -- Everything not valid or not currently handled
            player:PrintToPlayer("Invalid or unsupported LogID. The LogID must be 0-12.");
        end
    end
end