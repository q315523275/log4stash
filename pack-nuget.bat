rmdir /S /Y bin
%windir%\Microsoft.NET\Framework\v4.0.30319\msbuild.exe src\log4stash.sln /t:Clean,Rebuild /p:Configuration=Release /fileLogger
%~dp0src\packages\NUnit.ConsoleRunner.3.7.0\tools\nunit-console.exe -noxml -nodots -labels %~dp0src\log4stash.Tests\bin\Release\log4stash.Tests.dll

copy LICENSE bin
copy readme.txt bin

src\.nuget\NuGet.exe pack log4stash.nuspec -Basepath bin
