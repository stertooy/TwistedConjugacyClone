LoadPackage( "TwistedConjugacyClone" );
ASSERT@TwistedConjugacy := true;
testOpts := rec(
    exitGAP := false,
    showProgress := true,
    testOptions := rec( compareFunction := "uptowhitespace" )
);

pass := TestDirectory(
    [
        DirectoriesPackageLibrary( "TwistedConjugacyClone", "tst/pcgroup" ),
        DirectoriesPackageLibrary( "TwistedConjugacyClone", "tst/permgroup" )
    ],
    testOpts
);

if LoadPackage( "Polycyclic" ) then
    CHECK_CENT@Polycyclic := true;
    CHECK_IGS@Polycyclic := true;
    CHECK_INTSTAB@Polycyclic := true;
    pass := TestDirectory(
        DirectoriesPackageLibrary( "TwistedConjugacyClone", "tst/pcpgroup" ),
        testOpts
    ) and pass;
fi;

ForceQuitGap( pass );
