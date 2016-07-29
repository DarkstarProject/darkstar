---------------------------------------------------------------------------------------------------
-- func: setweather
-- desc: Sets the current weather for the current zone.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "s"
};

function onTrigger(player, weather)
    local weatherList =
    {
        ["none"]            = 0,
        ["sunshine"]        = 1,
        ["clouds"]          = 2,
        ["fog"]             = 3,
        ["hot spell"]       = 4,
        ["heat wave"]       = 5,
        ["rain"]            = 6,
        ["squall"]          = 7,
        ["dust storm"]      = 8,
        ["sand storm"]      = 9,
        ["wind"]            = 10,
        ["gales"]           = 11,
        ["snow"]            = 12,
        ["blizzards"]       = 13,
        ["thunder"]         = 14, 
        ["thunderstorms"]   = 15,
        ["auroras"]         = 16,
        ["stellar glare"]   = 17,
        ["gloom"]           = 18,
        ["darkness"]        = 19
    };

    if (weather == nil) then
        player:PrintToPlayer("You must enter a valid weather name or id.");
        return;
    end

    local weatherId = 0;
    if (tonumber(weather) ~= nil) then
        weatherId = weather;
    else
        weatherId = weatherList[ string.lower( weather ) ];
        if (weatherId == nil) then
            player:PrintToPlayer( string.format( "Invalid weather '%s' given.", weather ) );
            return;
        end
    end

    player:setWeather( weatherId );
end