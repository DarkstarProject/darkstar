NyzulIsle = {

    text = {
        -- General Texts
        ITEM_CANNOT_BE_OBTAINED = 6379; -- You cannot obtain the item <item> come back again after sorting your inventory
        ITEM_OBTAINED = 6385; -- Obtained: <item>
        GIL_OBTAINED = 6386; -- Obtained <number> gil
        KEYITEM_OBTAINED = 6388; -- Obtained key item: <keyitem>

        -- Assault Texts
        TIME_TO_COMPLETE = 7300, -- to complete this mission
        MISSION_FAILED = 7301, -- The mission has failed. Leaving area
        TIME_REMAINING_MINUTES = 7305, -- minute/minutes
        TIME_REMAINING_SECONDS = 7306, -- second/seconds
        PARTY_FALLEN = 7308, -- party members have fallen in battle. Mission failure in

        -- Amnaf/Flayer Amnaf battle texts
        FORMATION_GELINCIK = 7500, -- Formation Gelincik! Eliminate the intruders!≺Prompt≻
        SURRENDER          = 7501, -- You would be wise to surrender. A fate worse than death awaits those who anger an Immortal...≺Prompt≻
        I_WILL_SINK_YOUR_CORPSES = 7502; -- I will sink your corpses to the bottom of the Cyan Deep!≺Prompt≻
        AWAKEN          = 7503, -- Awaken, powers of the Lamiae!≺Prompt≻
        MANIFEST        = 7504, -- Manifest, powers of the Merrow!≺Prompt≻
        CURSED_ESSENCES = 7505, -- Cursed essences of creatures devoured...Infuse my blood with your beastly might!≺Prompt≻
        UGH             = 7506, -- Ugh...I should not be surprised...
        CANNOT_WIN      = 7507, -- Hehe...hehehe...You are...too strong for me...I cannot win...in this way...≺Prompt≻
        CANNOT_LET_YOU_PASS = 7508, -- <Wheeze>...I cannot...let you...pass...≺Prompt≻
        WHEEZE              = 7509, -- <Wheeze>...≺Prompt≻
        WHEEZE_PHSHOOO      = 7510, -- <Wheeze>...<phshooo>!≺Prompt≻
        PHSHOOO             = 7511, -- <Phshooo>...≺Prompt≻
        NOT_POSSIBLE        = 7512, -- <Phshooo>...Not...possible...≺Prompt≻

        -- Naja battle texts
        ALRRRIGHTY = 7513, -- Alrrrighty!
        CHA_CHING  = 7514, -- Cha-ching! Thirty gold coins!≺Prompt≻
        TWELVE_GOLD_COINS = 7515, -- Hehe! This one'll cost ya twelve gold coins a punch! The grrreat gouts of blood are frrree of charge!≺Prompt≻
        NINETY_NINE_SILVER_COINS = 7516; -- Ninety-nine silver coins a pop! A bargain, I tell ya!≺Prompt≻
        THIS_BATTLE = 7517, -- This battle is rrreally draggin' on... Just think of the dry cleanin' bill!≺Prompt≻
        OW          = 7518, -- Ow...! Ya do rrrealize the medical costs are comin' outta your salary, don't ya?≺Prompt≻
        ABQUHBAH    = 7519, -- A-Abquhbah! D-don't even think about...rrraisin' the wages...Management...is a mean world...ugh...≺Prompt≻
        OH_ARE_WE_DONE  = 7520, -- Oh, are we done? I wasn't done rrrackin' up the fees...You've got more in ya, rrright?≺Prompt≻
        NOW_WERE_TALKIN = 7521, -- Now we're talkin'! I can hear the clinkin' of coin mountains collapsin' over my desk...Let's get this over with!≺Prompt≻

        -- Raubahn battle texts (ToAU 44)
        PRAY   = 7522, -- Pray to whatever gods you serve.≺Prompt≻
        BEHOLD = 7523, -- Behold the power of my eldritch gaze!≺Prompt≻
        CARVE  = 7524, -- I will carve the soul fresh from your bones.≺Prompt≻
        RESIST_MELEE = 7525, -- My flesh remembers the wounds of ten thousand blades. Come, cut me again...≺Prompt≻
        RESIST_MAGIC = 7526, -- My skin remembers the fires of ten thousand spells. Come, burn me again...≺Prompt≻
        RESIST_RANGE = 7527, -- My belly remembers the punctures of ten thousand arrows. Come, shoot me again...≺Prompt≻
        NOW_UNDERSTAND = 7528, -- Hehehe...Do you now understand what it is to fight a true Immortal? Realize your futility and embrace despair...≺Prompt≻
        MIRACLE        = 7529, -- Ugh... Has your god granted you the miracle you seek...?≺Prompt≻

        -- Alexander battle texts (ToAU 44)
        SHALL_BE_JUDGED     = 7531, -- I am...Alexander...The meek...shall be rewarded...The defiant...shall be judged...≺Prompt≻
        OFFER_THY_WORSHIP   = 7532, -- Offer thy worship...I shall burn away...thy transgressions...≺Prompt≻
        OPEN_THINE_EYES     = 7533, -- Open thine eyes...My radiance...shall guide thee...≺Prompt≻
        CEASE_THY_STRUGGLES = 7534, -- Cease thy struggles...I am immutable...indestructible...impervious...immortal...≺Prompt≻
        RELEASE_THY_SELF    = 7535, -- Release thy self...My divine flames...shall melt thy flesh...sear thy bones...unshackle thy soul...≺Prompt≻
        BASK_IN_MY_GLORY    = 7536, -- Bask in my glory...Mine existence...stretches into infinity...≺Prompt≻
        REPENT_THY_IRREVERENCE = 7537, -- Repent thy irreverence...The gate to salvation...lies before thee...Revelation...is within thy reach...≺Prompt≻
        ACCEPT_THY_DESTRUCTION = 7538, -- Accept thy destruction...Wish for eternity...yearn for immortality...Sense thy transience...know thy insignificance...≺Prompt≻
        OMEGA_SPAM             = 7539, -- ΩΩΩΩΩΩΩ≺Prompt≻
        SHALL_KNOW_OBLIVION    = 7540 -- I am...Alexander...The fearful...shall be embraced...The bold...shall know oblivion...≺Prompt≻
    },

    mobs = {
        -- Path of Darkness
        [58] = {
            AMNAF_BLU = 17093132,
            AMNAF_PSYCHEFLAYER = 17093133,
            IMPERIAL_GEAR1 = 17093134,
            IMPERIAL_GEAR2 = 17093135,
            IMPERIAL_GEAR3 = 17093136,
            IMPERIAL_GEAR4 = 17093137,
            NAJA = 17093142,
        },
        [59] = {
            RAZFAHD = 17093143,
            ALEXANDER = 17093144,
            RAUBAHN = 17093145,
        }
    },

    npcs = {
        _257 = 17093359,
        _259 = 17093361,
        QM1 = 17093472,
        BLANK1 = 17093473,
        BLANK2 = 17093474,
        BLANK3 = 17093475,
        NASHMEIRA1 = 17093476,
        NASHMEIRA2 = 17093477,
        RAZFAHD = 17093478,
        CSNPC1 = 17093479,
        GHATSAD = 17093480,
        ALEXANDER = 17093481,
        CSNPC2 = 17093482,
        WEATHER = 17093423,
    }

}
