@echo off
cls
if exist build rmdir /s /q build
mkdir build
cd src
javac -d ../build com/krzem/precise_math/Main.java&&jar cvmf ../manifest.mf ../build/precise_math.jar -C ../build *&&goto run
cd ..
goto end
:run
cd ..
pushd "build"
for /D %%D in ("*") do (
	rd /S /Q "%%~D"
)
for %%F in ("*") do (
	if /I not "%%~nxF"=="precise_math.jar" del "%%~F"
)
popd
cls
java -jar build/precise_math.jar
:end
