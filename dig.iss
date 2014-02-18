; dig Windows Setup Script created by Rui Lopes (ruilopes.com).
;
; TODO sign the setup?
;      NB: Unizeto Certum has free certificates to open-source authors.
;      See http://www.certum.eu/certum/cert,offer_software_publisher.xml
;      See https://developer.mozilla.org/en/Signing_a_XPI

#define AppVersion "9.9.5-W1"
#define AppFileVersion "9.9.5.1"
#define DigHome "vendor\BIND" + AppVersion
#ifdef _WIN64
#define Bits "64"
#define ArchitecturesInstallIn64BitMode "x64"
#define ArchitecturesAllowed "x64"
#else
#define Bits "32"
#define ArchitecturesInstallIn64BitMode
#define ArchitecturesAllowed "x86 x64"
#endif

[Setup]
ArchitecturesInstallIn64BitMode={#ArchitecturesInstallIn64BitMode}
ArchitecturesAllowed={#ArchitecturesAllowed}
AppID={{9F9033EA-0591-4D18-964A-9A9192E3E65E}
AppName=dig
AppVersion={#AppVersion}
VersionInfoVersion={#AppFileVersion}
AppPublisher=rgl
AppPublisherURL=https://bitbucket.org/rgl/dig-setup
AppSupportURL=https://bitbucket.org/rgl/dig-setup
AppUpdatesURL=https://bitbucket.org/rgl/dig-setup
DefaultDirName={pf}\dig
DefaultGroupName=dig
OutputDir=.
OutputBaseFilename=dig-{#AppVersion}-setup-{#Bits}-bit
Compression=lzma2/max
SolidCompression=yes

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Dirs]
Name: "{app}"

[Files]
Source: "{#DigHome}\dig.exe"; DestDir: "{app}"
Source: "{#DigHome}\dig.html"; DestDir: "{app}"
Source: "{#DigHome}\libbind9.dll"; DestDir: "{app}"
Source: "{#DigHome}\libdns.dll"; DestDir: "{app}"
Source: "{#DigHome}\libeay32.dll"; DestDir: "{app}"
Source: "{#DigHome}\libisc.dll"; DestDir: "{app}"
Source: "{#DigHome}\libisccc.dll"; DestDir: "{app}"
Source: "{#DigHome}\libisccfg.dll"; DestDir: "{app}"
Source: "{#DigHome}\liblwres.dll"; DestDir: "{app}"
Source: "{#DigHome}\libxml2.dll"; DestDir: "{app}"
Source: "{#DigHome}\CHANGES"; DestDir: "{app}"; DestName: "CHANGES.txt"; Flags: isreadme
Source: "{#DigHome}\README"; DestDir: "{app}"; DestName: "README.txt"; Flags: isreadme
Source: "{#DigHome}\COPYRIGHT"; DestDir: "{app}"; DestName: "COPYRIGHT.txt"
Source: "dig Home.url"; DestDir: "{app}"
Source: "dig Setup Home.url"; DestDir: "{app}"

[Icons]
Name: "{group}\dig Home"; Filename: "{app}\dig Home.url"
Name: "{group}\dig Setup Home"; Filename: "{app}\dig Setup Home.url"
Name: "{group}\dig Manual"; Filename: "{app}\dig.html"
Name: "{group}\dig Read Me"; Filename: "{app}\README.txt"
Name: "{group}\dig License"; Filename: "{app}\COPYRIGHT.txt"
Name: "{group}\Uninstall dig"; Filename: "{uninstallexe}"
