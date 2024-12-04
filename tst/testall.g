LoadPackage( "TwistedConjugacyClone" );
ASSERT@TwistedConjugacyClone := true;

pass := TestDirectory(
    [
        DirectoriesPackageLibrary( "TwistedConjugacyClone", "tst/pcgroup" ),
        DirectoriesPackageLibrary( "TwistedConjugacyClone", "tst/permgroup" )
    ],
    rec(
        exitGAP := false,
        showProgress := true,
        testOptions := rec( compareFunction := "uptowhitespace" )
    )
);

if LoadPackage( "Polycyclic" ) then
    pass := pass and TestDirectory(
        DirectoriesPackageLibrary( "TwistedConjugacyClone", "tst/pcpgroup" ),
        rec(
            exitGAP := false,
            showProgress := true,
            testOptions := rec( compareFunction := "uptowhitespace" )
        )
    );
fi;

ForceQuitGap( pass );
