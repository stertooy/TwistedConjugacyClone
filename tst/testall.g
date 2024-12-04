LoadPackage( "TwistedConjugacy-clone" );
ASSERT@TwistedConjugacy := true;

pass := TestDirectory(
    [
        DirectoriesPackageLibrary( "TwistedConjugacy-clone", "tst/pcgroup" ),
        DirectoriesPackageLibrary( "TwistedConjugacy-clone", "tst/permgroup" )
    ],
    rec(
        exitGAP := false,
        showProgress := true,
        testOptions := rec( compareFunction := "uptowhitespace" )
    )
);

if LoadPackage( "Polycyclic" ) then
    pass := pass and TestDirectory(
        DirectoriesPackageLibrary( "TwistedConjugacy-clone", "tst/pcpgroup" ),
        rec(
            exitGAP := false,
            showProgress := true,
            testOptions := rec( compareFunction := "uptowhitespace" )
        )
    );
fi;

ForceQuitGap( pass );
