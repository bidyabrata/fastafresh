<footer>
    <div class="container">
        <div class="row">
            <div class="col-12 col-md-6">
                <img class="ftrLogo" style="max-width:50px;" src="<?php echo $imagePath; ?>/site/logo.jpeg" /> <strong>"Plant a Tree, Plant a hope"</strong>
                <p class="ftrAbout">
                    Plant beautifies your home by inviting health, love, and abundance. Many of you enjoy living and working in cultivated green spaces and most like having beautiful plants around. Plant truly amp up your space.
                    Plants in your home or office can make you feel more comfortable, soothed, and natural. Plants increase feelings of well-being among people with depression, anxiety, dementia, and other conditions. <a href="<?php echo $baseUrl . "/about-us"; ?>">READ MORE</a>
                </p>
            </div>
            <div class="col-6 col-md-3">
                <h5 class="ftrHdr">Know More</h5>
                <a class="footer-menu" href="<?php echo $baseUrl . "/about-us"; ?>">About Us</a><br />
                <a class="footer-menu" href="<?php echo $baseUrl . "/privacy-policy"; ?>">Privacy Policy</a><br />
                <a class="footer-menu" href="<?php echo $baseUrl . "/refund-policy"; ?>">Refund Policy</a><br />
                <a class="footer-menu" href="<?php echo $baseUrl . "/shipping-policy"; ?>">Shipping Policy</a><br />
                <a class="footer-menu" href="<?php echo $baseUrl . "/terms-and-condition"; ?>">Terms and Condition</a><br />
                <a class="footer-menu" href="<?php echo $baseUrl . "/severance"; ?>">Severance</a><br />
                <a class="footer-menu" href="<?php echo $baseUrl . "/warranty"; ?>">Warranty</a><br />
            </div>
            <div class="col-6 col-md-3">
                <h5 class="ftrHdr">Contacts</h5>
                <div class="ftrCntc"><img src="<?php echo $imagePath; ?>/site/call.png" /> +91 94340 73488</div>
                <div class="ftrCntc"><img src="<?php echo $imagePath; ?>/site/mail.png" /> info@fastafresh.com
                </div>
                <address>Fasta fresh<br />
                    Dignagar, Nadia, West Bengal - 741114<br />
                </address>
            </div>
        </div>
    </div>
    <div class="btmFtr">
        <div class="container">
            <div class="row">
                <div class="col-12 text-center">
                    © 2019-21 <a href="<?php echo $baseUrl; ?>">Fasta Fresh</a>, All Rights Reserved.
                </div>
            </div>
        </div>
    </div>
</footer>

<div id="login" class="mfp-hide login-modal">
    <a class="popup-modal-dismiss" href="#">X</a>
    <div class="bg-red loginPg forSignUp">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="max-960 mx-auto">
                        <div class="lgfrmWrp">
                            <div class="mnBigBx">
                                <div class="FrmBx">
                                    <div class="FrmBxCntr">
                                        <h2>SIGN UP</h2>
                                        <p>New User? Let's get registered.</p>
                                        <form id="regForm">
                                            <span class="input input--hoshi">
                                                <input class="input__field input__field--hoshi" type="text" id="namereg" name="namereg" required />
                                                <label class="input__label input__label--hoshi input__label--hoshi-color-1" for="namereg">
                                                    <span class="input__label-content input__label-content--hoshi">Name</span>
                                                </label>
                                            </span>

                                            <span class="input input--hoshi">
                                                <input class="input__field input__field--hoshi" type="email" id="emailreg" name="emailreg" required />
                                                <label class="input__label input__label--hoshi input__label--hoshi-color-1" for="emailreg">
                                                    <span class="input__label-content input__label-content--hoshi">Email</span>
                                                </label>
                                            </span>

                                            <span class="input input--hoshi">
                                                <input class="input__field input__field--hoshi" type="tel" id="noreg" name="noreg" required />
                                                <label class="input__label input__label--hoshi input__label--hoshi-color-1" for="noreg">
                                                    <span class="input__label-content input__label-content--hoshi">Phone</span>
                                                </label>
                                            </span>
                                            <button class="pillDark bigPill font-normal  btn  mt-4" type="submit">Register</button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                            <div class="smlBx">
                                <div class="smlBxMdl">
                                    <div style="cursor:pointer;" id="openSignup">
                                        <img alt="" class="" src="assets/images/login/signup.svg">
                                        <div class="text-sm mt-4 mb-2 text-grey">Already have an account?</div>
                                        <div class="text-4xl">LOGIN</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>

    <div class="bg-red loginPg forLogin" style="display:none;">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="max-960 mx-auto">
                        <div class="lgfrmWrp">
                            <div class="mnBigBx">
                                <div class="FrmBx">
                                    <div class="FrmBxCntr">
                                        <h2>LOGIN</h2>
                                        <p>Login and let's get started!</p>
                                        <form id="loginForm">
                                            <span class="input input--hoshi">
                                                <input class="input__field input__field--hoshi" type="email" id="emaillog" name="emaillog" required />
                                                <label class="input__label input__label--hoshi input__label--hoshi-color-1" for="emaillog">
                                                    <span class="input__label-content input__label-content--hoshi">Email</span>
                                                </label>
                                            </span>
                                            <span class="input input--hoshi">
                                                <input class="input__field input__field--hoshi" type="password" id="emaillog" name="password" required />
                                                <label class="input__label input__label--hoshi input__label--hoshi-color-1" for="password">
                                                    <span class="input__label-content input__label-content--hoshi">Password</span>
                                                </label>
                                            </span>

                                            <div class="checkForOtp">
                                                <button id="checkForOtp" class="pillDark bigPill font-normal mt-4" type="submit">Login</button>
                                            </div>

                                        </form>
                                    </div>
                                </div>
                            </div>
                            <div class="smlBx">
                                <div class="smlBxMdl">
                                    <div style="cursor:pointer;" id="openLogin">
                                        <img alt="" class="" src="assets/images/login/login.svg">
                                        <div class="text-sm mt-4 mb-2 text-grey">New User? Let get registered!</div>
                                        <div class="text-4xl">SIGN Up</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>