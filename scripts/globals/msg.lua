------------------------------------------------------------------------
-- This file holds all global (not zone specific) text references
------------------------------------------------------------------------


------------------------------------
-- Chat types
------------------------------------

chatType =
{
    SAY            = 0,
    SHOUT          = 1,
    TELL           = 3,
    PARTY          = 4,
    LINKSHELL      = 5,
    SYSTEM_1       = 6, -- Standard "PrintToPlayer" default if no type specified
    SYSTEM_2       = 7, -- Login / world announcement messages
    EMOTION        = 8,
    -- 9 / 10 / 11 = Does not work / nothing
    GM_PROMPT      = 12, -- Menu prompt from GM
    NS_SAY         = 13, -- Same as MESSAGE_SAY but has no speaker object displayed
    NS_SHOUT       = 14, -- Same as MESSAGE_SHOUT but has no speaker object displayed
    NS_PARTY       = 15, -- Same as MESSAGE_PARTY but has no speaker object displayed
    NS_LINKSHELL   = 16, -- Same as MESSAGE_LINKSHELL but has no speaker object displayed
    UNKNOWN_17     = 17, -- 17 through 25 appear to repeat the effects of other values
    UNKNOWN_18     = 18,
    UNKNOWN_19     = 19,
    UNKNOWN_20     = 20,
    UNKNOWN_21     = 21,
    UNKNOWN_22     = 22,
    UNKNOWN_23     = 23,
    UNKNOWN_24     = 24,
    UNKNOWN_25     = 25,
    YELL           = 26,
    LINKSHELL2     = 27, -- Second LS color...Default is Green
    NS_LINKSHELL2  = 28, -- Same as LINKSHELL_2 but has but has no speaker object displayed
    SYSTEM_3       = 29, -- "Basic system messages" in config menu. Yellow by default.
    LINKSHELL3     = 30, -- Yes really it looks like a 3rd LS may have been planned at some point.
    NS_LINKSHELL3  = 31, -- (assumed as it follows pattern and color)
    UNKNOWN_32     = 32, -- Looks the same as 31
    UNITY          = 33
};

------------------------------------
-- Message Basic
------------------------------------

msgBasic =
{
    NONE = 0, -- Display nothing

    -- Unsorted messages used by ability.lua, monstertpmoves.lua, and automatonweaponskills.lua
    BUFF_FAIL              = 75;
    RESIST                 = 85,
    FAMILIAR               = 108,
    DISAPPEAR              = 159, -- <target>'s stun effect disappears!
    DAMAGE                 = 185, -- player uses, target takes 10 damage. DEFAULT
    DAMAGE_SECONDARY       = 264,
    BUFF                   = 186,
    DRAIN_HP               = 187,
    MISS                   = 188,
    MISS_SECONDARY         = 282,
    NO_EFFECT              = 189,
    RECOVER_MP             = 224,
    DRAIN_MP               = 225,
    DRAIN_TP               = 226,
    DISAPPEAR_NUM          = 231, -- <num> of <target>'s effects disappear!
    SELF_HEAL              = 238,
    SELF_HEAL_SECONDARY    = 263,
    ENFEEB_IS              = 242, -- XXX is petrified.
    ENFEEB                 = 243, -- XXX receives the effect of petrification.
    TP_REDUCED             = 362, -- tp reduced to
    ATTR_DRAINED           = 369,
    EFFECT_DRAINED         = 370, -- <num> status effects are drained from <target>.
    TP_INCREASE            = 409,

    -- Misc other unsorted
    DEFEATS_TARG           = 6, -- The <player> defeats <target>.
    ALREADY_CLAIMED        = 12, -- Cannot attack. Your target is already claimed.
    IS_INTERRUPTED         = 16, -- The <player>'s casting is interrupted.
    UNABLE_TO_CAST         = 18, -- Unable to cast spells at this time.
    CANNOT_PERFORM         = 71, -- The <player> cannot perform that action.
    CANNOT_PERFORM_TARG    = 72, -- That action cannot be performed on <target>.
    UNABLE_TO_USE_JA       = 87, -- Unable to use job ability.
    UNABLE_TO_USE_JA2      = 88, -- Unable to use job ability.
    IS_PARALYZED           = 29, -- The <player> is paralyzed.
    ANTICIPATE             = 30,
    SHADOW_ABSORB          = 31, -- .. of <target>'s shadows absorb the damage and disappear.
    NOT_ENOUGH_MP          = 34, -- The <player> does not have enough MP to cast (NULL).
    NO_NINJA_TOOLS         = 35, -- The <player> lacks the ninja tools to cast (NULL).
    UNABLE_TO_CAST_SPELLS  = 49, -- The <player> is unable to cast spells.
    WAIT_LONGER            = 94, -- You must wait longer to perform that action.
    USES_JA                = 100, -- The <player> uses ..
    USES                   = 101, -- The <entity> uses ..
    USES_RECOVERS_HP       = 102, -- The <player> uses .. <target> recovers .. HP.
    USES_JA_TAKE_DAMAGE    = 317, -- The <player> uses .. <target> takes .. points of damage.
    IS_INTIMIDATED         = 106, -- The <player> is intimidated by <target>'s presence.
    CANNOT_ON_THAT_TARG    = 155, -- You cannot perform that action on the specified target.
    CANNOT_ATTACK_TARGET   = 446, -- You cannot attack that target
    NEEDS_2H_WEAPON        = 307, -- That action requires a two-handed weapon.
    USES_BUT_MISSES        = 324, -- The <player> uses .. but misses <target>.
    CANT_BE_USED_IN_AREA   = 316, -- That action cannot be used in this area.
    REQUIRES_SHIELD        = 199, -- That action requires a shield.
    REQUIRES_COMBAT        = 525, -- .. can only be performed during battle.
    STATUS_PREVENTS        = 569, -- Your current status prevents you from using that ability.

    -- Distance
    TARG_OUT_OF_RANGE      = 4, -- <target> is out of range.
    UNABLE_TO_SEE_TARG     = 5, -- Unable to see <target>.
    LOSE_SIGHT             = 36, -- You lose sight of <target>.
    TOO_FAR_AWAY           = 78, -- <target> is too far away.

    -- Weaponskills
    CANNOT_USE_WS          = 190, -- The <player> cannot use that weapon ability.
    NOT_ENOUGH_TP          = 192, -- The <player> does not have enough TP.

    -- Pets
    REQUIRES_A_PET         = 215, -- That action requires a pet.
    THAT_SOMEONES_PET      = 235, -- That is someone's pet.
    ALREADY_HAS_A_PET      = 315, -- The <player> already has a pet.
    NO_EFFECT_ON_PET       = 336, -- No effect on that pet.
    NO_JUG_PET_ITEM        = 337, -- You do not have the necessary item equipped to call a beast.
    MUST_HAVE_FOOD         = 347, -- You must have pet food equipped to use that command.
    PET_CANNOT_DO_ACTION   = 574, -- <player>'s pet is currently unable to perform that action.
    PET_NOT_ENOUGH_TP      = 575, -- <player>'s pet does not have enough TP to perform that action.

    -- Items
    CANNOT_USE_ITEM_ON     = 92 , -- Cannot use the <item> on <target>.
    ITEM_FAILS_TO_ACTIVATE = 62 , -- The <item> fails to activate.
    FULL_INVENTORY         = 356, --  Cannot execute command. Your inventory is full.

    -- Ranged
    NO_RANGED_WEAPON       = 216, -- You do not have an appropriate ranged weapon equipped.
    CANNOT_SEE             = 217, -- You cannot see <target>.
    MOVE_AND_INTERRUPT     = 218, -- You move and interrupt your aim.

    -- Additional effects and spike effects
    SPIKES_EFFECT_DMG      = 44 , -- <Defender>'s spikes deal <number> points of damage to the <Attacker>.
    SPIKES_EFFECT_HP_DRAIN = 132, -- <Defender>'s spikes drain <number> HP from the <Attacker>.
    ADD_EFFECT_MP_HEAL     = 152, -- Additional effect: The <player> recovers <number> MP.
    ADD_EFFECT_STATUS      = 160, -- Additional effect: <Status Effect>.
    ADD_EFFECT_HP_DRAIN    = 161, -- Additional effect: <number> HP drained from <target>.
    ADD_EFFECT_MP_DRAIN    = 162, -- Additional effect: <number> MP drained from <target>.
    ADD_EFFECT_DMG         = 163, -- Additional effect: <number> points of damage.
    ADD_EFFECT_STATUS_2    = 164, -- Additional effect: <Status Effect>. (Duplicate?)
    ADD_EFFECT_TP_DRAIN    = 165, -- Additional effect: <number> TP drained from <target>.
    ADD_EFFECT_STATUS_3    = 166, -- Additional effect: The <target> gains the effect of <Status Effect>. (Only difference from 160 and 164 is "The")
    ADD_EFFECT_HP_HEAL     = 167, -- Additional effect: The <player> recovers <number> HP.
    ADD_EFFECT_DISPEL      = 168, -- Additional effect: <target>'s <Status Effect> effect disappears!
    ADD_EFFECT_WARP        = 169, -- Additional effect: Warp! (used by Halloween staves)
    STATUS_SPIKES          = 374, -- Striking <Defender>'s armor causes <Attacker> to become <status effect>.
    SPIKES_EFFECT_HEAL     = 383, -- <?>'s spikes restore <number> HP to the <?>.
    ADD_EFFECT_HEAL        = 384, -- Additional effect: <target> recovers <number> HP.

    -- Charm
    CANNOT_CHARM           = 210, -- The <player> cannot charm <target>!
    VERY_DIFFICULT_CHARM   = 211, -- It would be very difficult for the <player> to charm <target>.
    DIFFICULT_TO_CHARM     = 212, -- It would be difficult for the <player> to charm <target>.
    MIGHT_BE_ABLE_CHARM    = 213, -- The <player> might be able to charm <target>.
    SHOULD_BE_ABLE_CHARM   = 214, -- The <player> should be able to charm <target>.

    -- BLU
    LEARNS_SPELL           = 419, -- <target> learns (NULL)!

    -- COR
    ROLL_MAIN              = 420, -- The <player> uses .. The total comes to ..! <target> receives the effect of ..
    ROLL_SUB               = 421, -- <target> receives the effect of ..
    ROLL_MAIN_FAIL         = 422, -- The <player> uses .. The total comes to ..! No effect on <target>.
    ROLL_SUB_FAIL          = 423, -- No effect on <target>.
    DOUBLEUP               = 424, -- The <player> uses Double-Up. The total for . increases to ..! <target> receives the effect of ..
    DOUBLEUP_FAIL          = 425, -- The <player> uses Double-Up. The total for . increases to ..! No effect on <target>.
    DOUBLEUP_BUST          = 426, -- The <player> uses Double-Up. Bust! <target> loses the effect of ..
    DOUBLEUP_BUST_SUB      = 427, -- <target> loses the effect of ..
    NO_ELIGIBLE_ROLL       = 428, -- There are no rolls eligible for Double-Up. Unable to use ability.
    ROLL_ALREADY_ACTIVE    = 429, -- The same roll is already active on the <player>.

    EFFECT_ALREADY_ACTIVE  = 523, -- The same effect is already active on <player>.
    NO_FINISHINGMOVES      = 524  -- You have not earned enough finishing moves to perform that action.
};
