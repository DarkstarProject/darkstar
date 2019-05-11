-----------------------------------
--  PET: Elemental Spirits
-----------------------------------
require("scripts/globals/magic")
require("scripts/globals/status")
require("scripts/globals/weather")

dsp.pet = dsp.pet or {}
dsp.pet.spirit = dsp.pet.spirit or {}

-- Establishes an elemental spirit of the given element
---------------------------------------------------------------
dsp.pet.spirit.create = function(element)
    local spirit = dsp.pet.spirit.newSpirit()
    spirit.element = element
    spirit.weather_casting_mods =
    {
        [dsp.magic.singleWeatherStrong[spirit.element]] = -2000,
        [dsp.magic.doubleWeatherStrong[spirit.element]] = -2000,
        [dsp.magic.singleWeatherWeak[spirit.element]] = 2000,
        [dsp.magic.doubleWeatherWeak[spirit.element]] = 2000
    }
    spirit.day_casting_mods =
    {
        [dsp.magic.dayStrong[spirit.element]] = -3000,
        [dsp.magic.dayWeak[spirit.element]] = 3000
    }

    return spirit
end

-----------------------------------
--  SPIRIT OBJECT
-----------------------------------
dsp.pet.spirit.newSpirit = function()
    local this = {}

    -- These are initial definitions which will be overriden by
    -- the actual spirit type later.
    this.element = 0
    this.weather_casting_mods = {}
    this.day_casting_mods = {}

    -- Returns the cast time mod for spirit based on current weather
    ---------------------------------------------------------------
    this.getWeatherMod = function(spirit)
        local summoner = spirit:getMaster()
        local casting_time_mod = this.weather_casting_mods[summoner:getWeather()]
        if casting_time_mod then
            return casting_time_mod
        else
            return 0
        end
    end

    -- Returns the cast time mod for spirit based on current day
    ---------------------------------------------------------------
    this.getDayMod = function(spirit)
        local casting_time_mod = this.day_casting_mods[VanadielDayElement()]
        if casting_time_mod then
            return casting_time_mod
        else
            return 0
        end
    end

    -- Returns both the base spellcasting time based on master
    -- skill, and the summoner's current skill over cap
    ---------------------------------------------------------------
    this.getSkillMod = function(summoner)
        local summoning_skill = summoner:getSkillLevel(dsp.skill.SUMMONING_MAGIC)
        local max_skill = summoner:getMaxSkillLevel(summoner:getMainLvl(), dsp.job.SMN, dsp.skill.SUMMONING_MAGIC)
        local skill_vs_cap = summoning_skill - max_skill
        -- 48 s +/- 1 second for every 3 skill over or under cap
        local base_time = 48000 - ((summoning_skill - max_skill) / 3) * 1000
    
        return base_time, math.max(skill_vs_cap, 0)
    end

    -- Returns the cast time mod for spirit based on master gear
    ---------------------------------------------------------------
    this.getGearMod = function(summoner)
        -- TODO: MAKE THESE PROPER MODS
        -- Summoner's spats
        local leg = summoner:getEquipID(dsp.slot.LEGS);
        if leg == 15131 or leg == 15594 then
            return -5000
        end    
        return 0
    end

    -- Returns the spellcasting time for a spirit
    ---------------------------------------------------------------
    this.getCastingTime = function(spirit)
        local summoner = spirit:getMaster()
        local casting_time, over_cap = this.getSkillMod(summoner)
        casting_time = casting_time + this.getGearMod(summoner) +
                       this.getWeatherMod(spirit) + this.getDayMod(spirit)
        if summoner:hasStatusEffect(dsp.effect.ASTRAL_FLOW) then
            casting_time = casting_time - 5000
        end

        return math.max(casting_time, 0)
    end

    -- Returns the magical element of a spirit
    ---------------------------------------------------------------
    this.getElement = function(spirit)
        return this.element
    end

    -- Returns the delay before initiating spellcasting after engage
    ---------------------------------------------------------------
    this.getEngageDelay = function(spirit, delay)  
        local summoner = spirit:getMaster()    
        local fast_cast, smn_skill = this.getSkillMod(summoner)

        if summoner:hasStatusEffect(dsp.effect.ASTRAL_FLOW) then
            delay = fast_cast -- this will make the reduction the entire delay
        elseif smn_skill > 0 then            
            -- randomly cast on fight start
            if math.random(0, 99) < 25 then
                delay = fast_cast
            end
        end

        return delay
    end

    return this
end
