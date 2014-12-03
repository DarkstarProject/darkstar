-----------------------------------
-- SetExplorerMoogles
----------------------------------

function SetExplorerMoogles(moogle)

    if (EXPLORER_MOOGLE == 1) then
        local npc = GetNPCByID(moogle);
        if(npc == nil) then
            printf("'SetExplorerMoogles' Error trying to load undefined npc (%d)", Moogles[i]);
        else
            npc:setStatus(0);
        end
    end
end;

-----------------------------------
-- SetFieldManual
----------------------------------

function SetFieldManual(manuals)

    if (FIELD_MANUALS == 1) then
        for i,id in ipairs(manuals) do
            local npc = GetNPCByID(id);
            if(npc == nil) then
                printf("'SetFieldManual' Error trying to load undefined npc (%d)", id);
            else
                npc:setStatus(0);
            end
        end
    end
end;

-----------------------------------
-- SetGroundsTome
----------------------------------

function SetGroundsTome(tome)

    if (GROUNDS_TOMES == 1) then
        for i,id in ipairs(tome) do
            local npc = GetNPCByID(id);
            if(npc == nil) then
                printf("'SetGroundsTome' Error trying to load undefined npc (%d)", id);
            else
                npc:setStatus(0);
            end
        end
    end
end;

function SetRespawnTime(id, minTime, maxTime)

    local mob = GetMobByID(id);
    if(mob == nil) then
      printf("'SetTimedSpawns' Error trying to load undefined mob (%d)", id);
    else
      UpdateNMSpawnPoint(id);
      mob:setRespawnTime(math.random((minTime),(maxTime)));
    end
end