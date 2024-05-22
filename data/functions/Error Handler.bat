@ECHO OFF
TITLE (WINDHELM) Error Encountered ^| %errorType%
COLOR 4F
REM Error Handler. Version 1.1.1 (240205) For Windhelm Build 2 "Bottle o' Features"

REM Check error type
IF %errorType% == EnemyType (
    GOTO :enemyTypeError
) ELSE IF %errorType% == checkTime (
    GOTO :ctError
) ELSE IF %errorType% == attributeSkill (
    GOTO :aSerror
) ELSE IF %errorType% == encounterError (
    GOTO :eError
) ELSE IF %errorType% == LastLocal (
    GOTO :llError
) ELSE (
    REM ...an error, inside of Error Handler??? Unthinkable!
    SET errorType=unknownError
    ECHO Error Handler encountered an uknown error and cannot provide more information. >> ErrorHandler.log
    EXIT
)

REM Display the "Enemy Type" error.
:enemyTypeError
CLS
ECHO.
ECHO ERROR! Error Type: EnemyType.
ECHO =============================
ECHO This could mean:
ECHO The "currentEnemy" variable was left blank, or is unrecognized.
PAUSE
EXIT

REM Display the "Attribute - Skill" error.
:aSerror
CLS
ECHO.
ECHO ERROR! Error Type: attributeSkill.
ECHO Wuh-oh, Windhelm ran into a problem and can't continue!
ECHO What'd you do this time?
ECHO =======================================================
ECHO This error could mean:
ECHO The Player has modified their save, attempting to adjust Skill Levels to an undefined integer.
ECHO This... this is the only way to cause this error. Stop messing with my shit!
PAUSE
EXIT

:eError
CLS
ECHO.
ECHO Error Encountered - Windhelm has stopped.
ECHO Error Type: %errorType%
ECHO =======================================================
ECHO This could be caused by a corrupted script or save file.
ECHO If this repeats, email quitefrankish@gmail.com
PAUSE
EXIT

:llError
CLS
ECHO.
ECHO Error Encountered - Windhelm has stopped.
ECHO Error Type: %errorType%
echo %ll%
ECHO =======================================================
ECHO Corrupted or modified save file.
ECHO If this repeats, email quitefrankish@gmail.com
PAUSE
EXIT