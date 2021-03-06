<?php $img_url = base_url() . "assets/img/"; ?>   
<?php
$this->load->helper('url');
$base_url = base_url();
$gTotal = 0;
$qTotal = 0;
foreach ($items->result_array() as $q) :
    $qTotal += $q['quantity'];
endforeach;
?>
<section class="" id="">
    <div class="container">
        <div class="py-5 text-center">
            <h2>Checkout For Your Books/Events/Courses and Exams</h2>
            <p class="lead">Below is a list of items added to your cart by you and this checkout is to purchase the items in your cart</p>
        </div>
        <div class="row">
            <div class="col-md-4 order-md-2 mb-4">
                <h4 class="d-flex justify-content-between align-items-center mb-3">
                    <span class="text-muted">Your cart</span>
                    <span class="badge badge-secondary badge-pill"><?php echo $qTotal; ?></span>
                </h4>
                <ul class="list-group mb-3">
                    <?php foreach ($items->result_array() as $i) : ?>
                        <li class="list-group-item d-flex justify-content-between lh-condensed">
                            <img src="<?php echo $img_url . $i['image_path'] ?>" alt="" width="105px"/>
                            <div>
                                <h6 class="my-0"><?php echo $i['product_name']; ?></h6>
                                <small class="text-muted"><?php echo $i['product_desc']; ?></small>
                            </div>
                            <span class="text-muted"><strong style="color:#000;">Quantity:</strong> <?php echo $i['quantity']; ?></span>
                            <span class="text-muted"><strong style="color:#000;">Cost:</strong> €<?php echo $i['total']; ?></span>
                            <?php $gTotal += number_format($i['total'], 2); ?>
                        </li>
                    <?php endforeach; ?>
                    <li class="list-group-item d-flex justify-content-between">
                        <span>Total:</span>
                        <p><strong style="color:#000;">€<?php echo number_format($gTotal, 2); ?></strong> Inc. VAT</p>
                    </li>
                </ul>
            </div>
            <div class="col-md-8 order-md-1">
                <h4 class="mb-3">Billing address</h4>
                <?php if ($user->result_array() != false) : ?>
                    <?php foreach ($user->result_array() as $u) : ?>
                        <!--Registered User Confirmation Form-->
                        <form class="needs-validation" novalidate action="<?php echo site_url('ShoppingCart/confirmPurchase'); ?>" method="POST">
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <!--IF Statement [populate if email contains @ - leave blank if NULL]-->
                                    <label for="firstName">First name</label>
                                    <input type="text" class="form-control" name="fName" id="firstName" placeholder="" value="<?php echo $u['fName']; ?>" required>
                                    <div class="invalid-feedback">
                                        Valid first name is required.
                                    </div>
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label for="lastName">Last name</label>
                                    <input type="text" class="form-control" name="lName" id="lastName" placeholder="" value="<?php echo $u['lName']; ?>" required>
                                    <div class="invalid-feedback">
                                        Valid last name is required.
                                    </div>
                                </div>
                            </div>
                            <div class="mb-3">
                                <label for="email">Email</label>
                                <input type="email" class="form-control" name="email" id="email" placeholder="" value="<?php echo $u['email']; ?>" required>
                                <div class="invalid-feedback">
                                    Please enter a valid email address for shipping updates.
                                </div>
                            </div>
                            <div class="mb-3">
                                <label for="address">Address</label>
                                <input type="text" class="form-control" name="address" id="address" placeholder="" value="<?php echo $u['address']; ?>" required>
                                <div class="invalid-feedback">
                                    Please enter your shipping address.
                                </div>
                            </div>
                            <?php foreach ($items->result_array() as $i) : ?>
                                <input type="hidden" name="total" value="<?php echo $i['total']; ?>">
                            <?php endforeach; ?>

                            <hr class="mb-4">
                            <input type="submit" class="btn" value="Confirm Order">
                        </form>
                    <?php endforeach; ?>
                <?php else : ?>
                    <!--Non Registered User Confirmation Form-->
                    <form class="needs-validation" novalidate action="<?php echo site_url('ShoppingCart/confirmPurchase'); ?>" method="POST">
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <!--IF Statement [populate if email contains @ - leave blank if NULL]-->
                                <label for="firstName">First name</label>
                                <input type="text" class="form-control" name="fName" id="firstName" placeholder="" value="" required>
                                <div class="invalid-feedback">
                                    Valid first name is required.
                                </div>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label for="lastName">Last name</label>
                                <input type="text" class="form-control" name="lName" id="lastName" placeholder="" value="" required>
                                <div class="invalid-feedback">
                                    Valid last name is required.
                                </div>
                            </div>
                        </div>
                        <div class="mb-3">
                            <label for="email">Email</label>
                            <input type="email" class="form-control" name="email" id="email" placeholder="" value="" required>
                            <div class="invalid-feedback">
                                Please enter a valid email address for shipping updates.
                            </div>
                        </div>
                        <div class="mb-3">
                            <label for="address">Address</label>
                            <input type="text" class="form-control" name="address" id="address" placeholder="" value="" required>
                            <div class="invalid-feedback">
                                Please enter your shipping address.
                            </div>
                        </div>
                        <?php foreach ($items->result_array() as $i) : ?>
                                <input type="hidden" name="total" value="<?php echo $i['total']; ?>">
                        <?php endforeach; ?>
                        <hr class="mb-4">
                        <input type="submit" class="btn" value="Confirm Order">
                    </form>
                <?php endif; ?>
            </div>
        </div>
    </div>
</section>