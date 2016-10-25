ALLY_ASSIST_PLAYER = 1;
ALLY_ASSIST_RANDOM = 2;

function startAllyAssist(entity, assistMode, specificAlly)
    -- print("Ally Assist Initiated");

    if (entity == nil) then
        print("startAllyAssist: error, nil entity");
        return;
    end

    if (assistMode == nil) then
        assistMode = ALLY_ASSIST_PLAYER;
    end

    if(specificAlly ~= nil and type(specificAlly) == "userdata") then
        specificAlly = specificAlly:getID();
    end

    local mobs;
    local players;
    local allies;

    if (entity:getBattlefield() ~= nil) then
        mobs = entity:getBattlefield():getEnemies();
        players = entity:getBattlefield():getPlayers();
        allies = entity:getBattlefield():getAllies();
    elseif (entity:getInstance() ~= nil) then
        mobs = entity:getInstance():getMobs();
        players = entity:getInstance():getChars();
        allies = entity:getInstance():getAllies();
    else
        print("startAllyAssist: error: unable to obtain mob list! Aborting...");
        return;
    end

    -- If there's no mobs/players/allies, we can't assist. Don't waste time.
    if (next(mobs) == nil or next(players) == nil or next(allies) == nil) then
        return;
    end

    -- In this mode, find a player with a battle target, and assist that player
    if (assistMode == ALLY_ASSIST_PLAYER) then
       local assistTarget = 0;

        -- Loop players and find someone who is engaged in battle
        for i,player in pairs(players) do
            local battleTarget = player:getTarget();

            if (battleTarget ~= nil) then
                assistTarget = battleTarget:getShortID();
                break;
            end
        end

        -- printf("startAllyAssist: target = %u (ALLY_ASSIST_PLAYER)", assistTarget);

        -- Attack their target if found. If none found, we'll fall to ALLY_ASSIST_RANDOM.
        -- A variety of reasons could cause this - players have hate but are not engaged is one.
        -- Being aggroed when not engaged is another.
        if (assistTarget > 0) then
            for i,ally in pairs(allies) do
                -- If we have a specific ally specified, just do that one
                if (specificAlly ~= nil and ally:getID() ~= specificAlly) then
                    goto continue;
                end

                ally:engage(assistTarget);

                ::continue::
            end

            return;
        end
    end

    -- ALLY_ASSIST RANDOM - also a fallback for ALLY_ASSIST_PLAYER
    -- Pick an enemy to attack. Some allies do this intentionally. Some allies start to attack on their own if
    -- a player stalls too long. This can be used to set a target in both cases.
    for i,ally in pairs(allies) do
        -- If a specific ally was given, seek to it.
        if (specificAlly ~= nil and ally:getID() ~= specificAlly) then
            goto continue_allies;
        end

        local foundTarget = false;

        -- Let's find a random target
        while (foundTarget == false) do
            local mobCount = table.getn(mobs);
            local rand = math.random(0,mobCount);
            local seek = 0;

            -- Make sure at least one mob is alive as we iterate, or we'
            local atLeastOneMobAlive = false;

            for j,mob in pairs(mobs) do
                -- Record if mob is alive
                if (mob:isSpawned() and mob:isAlive()) then
                    atLeastOneMobAlive = true;
                end

                -- Skip to the random target
                if (seek < rand) then
                    seek = seek + 1;
                    goto continue_mobs;
                end

                -- Must be spawned and alive to be eligible. If it is, attack it.
                if (mob:isSpawned() and mob:isAlive()) then
                    ally:engage(mob:getShortID());
                    foundTarget = true;
                    break;
                end

                ::continue_mobs::
            end

            -- If no mobs were alive, we can't do anything. Break out.
            if (not(atLeastOneMobAlive)) then
                break;
            end
        end

        ::continue_allies::
    end
end
