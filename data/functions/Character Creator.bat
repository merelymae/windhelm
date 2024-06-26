@ECHO OFF
TITLE (WINDHELM) - Character Creator

REM Check for existing Player data.
IF EXIST "%cd%\data\player\savedata.txt" (
    GOTO :overwrite_saveQ
) ELSE (
    GOTO :ENTER_NAME
)

REM Warns the Player that an existing save has been found and asks if they wish to overwrite it.
:overwrite_saveQ
MODE con: cols=95 lines=20
CLS
ECHO.
TYPE "%cd%\data\assets\ui\overwrite_save.txt"
ECHO.
ECHO.
ECHO Warning! An existing save has been detected. Do you wish to overwrite this existing save?
ECHO +---------------------------------------------------------------------------------------------+
CHOICE /C YN /N /M "Y/N"
IF ERRORLEVEL 2 GOTO :DNO
IF ERRORLEVEL 1 GOTO :ENTER_NAME

REM Does not overwrite the save and quits back to Windhelm.
:DNO
SET OSQ=1
GOTO :EOF

:ENTER_NAME
MODE con: cols=120 lines=22
SET OSQ=0
CLS
ECHO.
TYPE "%cd%\data\assets\ui\your_name.txt"
ECHO.
ECHO.
ECHO Do you recall your name, Shard?
ECHO +----------------------------------------------------------------------------------------------------------------------+
SET /P player_name=
GOTO :CHOOSE_PRONOUN

:CHOOSE_PRONOUN
MODE con: cols=120 lines=20
CLS
ECHO.
TYPE "%cd%\data\assets\ui\pronouns.txt"
ECHO.
ECHO.
ECHO How do you wish others to refer to you?
ECHO +----------------------------------------------------------------------------------------------------------------------+
ECHO + [T] THEY/THEM/THEIRS
ECHO + [S] SHE/HER/HERS
ECHO + [H] HE/HIM/HIS
ECHO + [C] CUSTOM SELECTION
ECHO +----------------------------------------------------------------------------------------------------------------------+
CHOICE /C CHST /N /M ">"
IF ERRORLEVEL 4 GOTO :THT
IF ERRORLEVEL 3 GOTO :SHH
IF ERRORLEVEL 2 GOTO :HHH
IF ERRORLEVEL 1 GOTO :CUSTOM_P_PERSONAL

:THT
SET personal_p_1=they
SET personal_p_2=them
SET possesive_1=theirs
SET reflexive_1=themself
set intensive_1=themself
GOTO :CHOOSE_CLASS

:SHH
SET personal_p_1=she
SET personal_p_2=her
SET possesive_1=hers
SET reflexive_1=herself
set intensive_1=herself
GOTO :CHOOSE_CLASS

:HHH
SET personal_p_1=he
SET personal_p_2=him
SET possesive_1=his
SET reflexive_1=himself
set intensive_1=himself
GOTO :CHOOSE_CLASS

REM Custom Pronoun selection
:CUSTOM_P_PERSONAL
CLS
ECHO.
TYPE "%cd%\data\assets\ui\your_name.txt"
ECHO.
ECHO.
ECHO Custom Pronouns
ECHO +----------------------------------------------------------------------------------------------------------------------+
ECHO + Enter a PERSONAL pronoun. EXAMPLE: SHE/HER, HE/HIM, THEY/THEM, IT/ITS
ECHO + Due to limitations with Batch Script, please only enter ONE of these, you will be asked to select a second.
ECHO +----------------------------------------------------------------------------------------------------------------------+
SET /P personal_p_1=
GOTO :CHOOSE_P_PERSONAL_2

:CHOOSE_P_PERSONAL_2
CLS
ECHO.
TYPE "%cd%\data\assets\ui\your_name.txt"
ECHO.
ECHO.
ECHO Custom Pronouns / 2
ECHO +----------------------------------------------------------------------------------------------------------------------+
ECHO + Enter a PERSONAL pronoun. EXAMPLE: SHE/HER, HE/HIM, THEY/THEM, IT/ITS
ECHO +----------------------------------------------------------------------------------------------------------------------+
SET /P personal_p_2=
GOTO :CHOOSE_P_POSSESIVE

:CHOOSE_P_POSSESIVE
CLS
ECHO.
TYPE "%cd%\data\assets\ui\your_name.txt"
ECHO.
ECHO.
ECHO Custom Pronouns
ECHO +----------------------------------------------------------------------------------------------------------------------+
ECHO + Enter a POSSESIVE pronoun. EXAMPLE: HERS, HIS, THEIRS, ITS
ECHO +----------------------------------------------------------------------------------------------------------------------+
SET /P possesive_1=
GOTO :CHOOSE_P_REFLEXIVE_1

:CHOOSE_P_REFLEXIVE_1
CLS
ECHO.
TYPE "%cd%\data\assets\ui\your_name.txt"
ECHO.
ECHO.
ECHO Custom Pronouns
ECHO +----------------------------------------------------------------------------------------------------------------------+
ECHO + Enter a REFLEXIVE pronoun. EXAMPLE: HERSELF, HIMSELF, THEMSELF, ITSELF
ECHO +----------------------------------------------------------------------------------------------------------------------+
SET /P reflexive_1=
GOTO :CHOOSE_P_INTENSIVE

:CHOOSE_P_INTENSIVE
CLS
ECHO.
TYPE "%cd%\data\assets\ui\your_name.txt"
ECHO.
ECHO.
ECHO Custom Pronouns
ECHO +----------------------------------------------------------------------------------------------------------------------+
ECHO + Enter an INTENSIVE pronoun. EXAMPLE: HERSELF, HIMSELF, THEMSELF, ITSELF
ECHO +----------------------------------------------------------------------------------------------------------------------+
SET /P intensive_1=
GOTO :CHOOSE_CLASS

:CHOOSE_CLASS
SET SLOPr=INIT
CLS
ECHO.
TYPE "%cd%\data\assets\ui\your_class.txt"
ECHO.
ECHO Choose a class for your Character.
ECHO +----------------------------------------------------------------------------------------------------------------------+
ECHO + [S] Sorcerer : Magicka +50, Stamina -50, +10 Magicka Tonics, -2 magicka skill cost.
ECHO + [W] Warrior  : Health +60, Magicka -70, +5 Healing Tonics, -5 damage skill cost.
ECHO + [D] Druid : All attacks deal EARTH element damage, Health -30, Magicka +100, +5 Magicka tonics. -2 Magicka skill cost.
ECHO +----------------------------------------------------------------------------------------------------------------------+
CHOICE /C SWD /N /M ">"
IF ERRORLEVEL 3 GOTO :DRUID_CHOSEN_PREVIEW
IF ERRORLEVEL 2 GOTO :WARRIOR_CHOSEN_PREVIEW
IF ERRORLEVEL 1 GOTO :SORCERER_CHOSEN_PREVIEW
GOTO :CHOOSE_CLASS

:DRUID_CHOSEN_PREVIEW
MODE con: cols=120 lines=20
CLS
ECHO.
TYPE "%cd%\data\assets\ui\druid.txt"
ECHO.
ECHO.
ECHO Choose a class for your Character.
ECHO +----------------------------------------------------------------------------------------------------------------------+
ECHO + Druids are powerful Earth Type mages. They devote themselves to the protection and growth of the Forests around them.
ECHO + Druids deal EARTH type damage, dealing an extra 12 damage to enemies weak to EARTH.
ECHO + As a result of their devotion, they use part of their LIFE-FORCE to assist the forest, resulting in -30 health.
ECHO + The Gods of the EARTH element favor Druids, giving them +100 Magicka, -2 Magicka skill cost.
ECHO + MISC - +5 Magicka Tonics on start.
ECHO +----------------------------------------------------------------------------------------------------------------------+
ECHO [1 / CHOOSE ] ^| [E / BACK]
CHOICE /C 1E /N /M ">"
IF ERRORLEVEL 2 GOTO :CHOOSE_CLASS
IF ERRORLEVEL 1 GOTO :DRUID_CHOSEN
GOTO :CHOOSE_CLASS

:WARRIOR_CHOSEN_PREVIEW
MODE con: cols=120 lines=20
CLS
ECHO.
TYPE "%cd%\data\assets\ui\warrior.txt"
ECHO.
ECHO.
ECHO Choose a class for your Character.
ECHO +----------------------------------------------------------------------------------------------------------------------+
ECHO + Warriors are feared and respected from where they hail, allowing them fame and infamy within rivaling tribes.
ECHO + The Warriors intense lifestyle has increased their ability to gain strength, -5 Damage skill cost.
ECHO + Their tough skin and large muscles from training make them a tough opponent, +60 Health.
ECHO + Warriors sacrifice their magical abilites by devoting themselves to the Warrior God Shi'a'loh, -70 Magicka.
ECHO + MISC - +5 Healing Tonics on start.
ECHO +----------------------------------------------------------------------------------------------------------------------+
ECHO [1 / CHOOSE ] ^| [E / BACK]
CHOICE /C 1E /N /M ">"
IF ERRORLEVEL 2 GOTO :CHOOSE_CLASS
IF ERRORLEVEL 1 GOTO :WARRIOR_CHOSEN
GOTO :CHOOSE_CLASS

:SORCERER_CHOSEN_PREVIEW
MODE con: cols=120 lines=20
CLS
ECHO.
TYPE "%cd%\data\assets\ui\sorcerer.txt"
ECHO.
ECHO.
ECHO Choose a class for your Character.
ECHO +----------------------------------------------------------------------------------------------------------------------+
ECHO + Sorcerers wield extremely powerful magics, dealing +15 extra MGKA damage.
ECHO + Devoting themselves to the God of Sorcery Mah-Dume, they are blessed with +50 Magicka, -2 Magic skill cost.
ECHO + Magicka isn't the only thing these Sorcerers use when casting spells, however, powerful magics are also physically -
ECHO + intensive, an inexperienced Sorcerer could easily exhaust themselves if not careful. -50 Stamina.
ECHO + MISC - +10 Magicka Tonics on start.
ECHO +----------------------------------------------------------------------------------------------------------------------+
ECHO [1 / CHOOSE ] ^| [E / BACK]
CHOICE /C 1E /N /M ">"
IF ERRORLEVEL 2 GOTO :CHOOSE_CLASS
IF ERRORLEVEL 1 GOTO :SORCERER_CHOSEN
GOTO :CHOOSE_CLASS

:DRUID_CHOSEN
SET SLOPr=INIT
CALL "%cd%\data\functions\SLOP.bat"
SET player_health=70
SET player_health_max=70
SET player_magicka=200
SET player_magicka_max=200
SET player_class=Druid
SET player_class_ability=precognition
SET /A player_magickaTonic_owned+=5
SET SLOPr=SAVE
CALL "%cd%\data\functions\SLOP.bat"
GOTO :EOF

:WARRIOR_CHOSEN
SET SLOPr=INIT
CALL "%cd%\data\functions\SLOP.bat"
SET player_health=160
SET player_health_max=160
SET player_magicka=30
SET player_magicka_max=30
SET player_class=Warrior
SET player_class_ability=none
SET /A player_healingTonic_owned=!player_healingTonic_owned! +5
SET SLOPr=SAVE
CALL "%cd%\data\functions\SLOP.bat"
GOTO :EOF

:SORCERER_CHOSEN
SET SLOPr=INIT
CALL "%cd%\data\functions\SLOP.bat"
SET player_health=100
SET player_health_max=100
SET player_magicka=150
SET player_magicka_max=150
SET player_stamina=50
SET player_stamina_max=50
SET player_class=Sorcerer
SET player_class_ability=none
SET /A magickaT_q=!magickaT_q! +10
SET SLOPr=SAVE
CALL "%cd%\data\functions\SLOP.bat"
GOTO :EOF