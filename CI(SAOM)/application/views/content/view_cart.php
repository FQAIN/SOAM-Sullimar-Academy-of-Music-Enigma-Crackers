<?php $img_url = base_url() . "assets/img/"; ?>
<?php
$this->load->helper('url');
$base_url = base_url();
?>
<section class="featured-places" id="blog" style="background-color: white">
    <div class="container"> <!--Card Container Start-->
        <div class="row">
            <div class="col-md-12">

            </div> 
        </div> 
        <div class="row"> <!--Row Start-->

            <h2 class="text-center">Shopping Cart</h2>
            <p class="text-center"><a href="<?php echo base_url(); ?>index.php/Home/index/" class="back"><-Back to Home Menu</a></p>
            <div class="table-responsive mx-auto" style="width: 100%; padding: 40px;">
                <table class="table table-striped table-dark">
                    <thead>
                        <tr>
                            <td><strong>Product Name:</strong></td>
                            <td><strong>Description:</strong></td>
                            <td><strong>Quantity:</strong></td>
                            <td><strong>Price:</strong></td>
                            <td><strong>Image:</strong></td>
                            <td><strong>Delete:</strong></td>
                        </tr>
                    </thead>
                    <tbody>
                        <?php foreach ($items->result_array() as $item): ?>
                            <tr>
                                <td><?php echo $item['product_name']; ?></td>
                                <td><?php echo $item['product_desc']; ?></td>
                                <td><?php echo $item['quantity']; ?></td>
                                <td><?php echo $item['price']; ?></td>
                                <td><img src="<?php echo $img_url . $item['image_path'] ?>" alt="" width="140px"/></td>
                                <td>
                                    <?php if(!strpos($this->session->userdata('email'), '@')) : ?>
                                        <form action="<?php echo site_url('ShoppingCart/deleteItem'); ?>" method="POST">
                                            
                                    <?php elseif(strpos($this->session->userdata('email'), '@')) : ?>
                                        <form action="<?php echo site_url('ShoppingCartStudent/deleteItem'); ?>" method="POST">
                                            
                                    <?php endif; ?>
                                        <input type="hidden" name="booksID" value="<?php echo $item['booksID'] ?>">
                                        <input type="hidden" name="userID" value="<?php echo $item['email']?>">
                                        <input type="submit" class="btn btn-light" value="Delete">
                                    </form>
                                </td>
                            </tr>
                        <?php endforeach; ?>
                    </tbody>
                </table>
            </div>

        </div> <!--Row End-->
    </div> <!--Card Container End-->
</section>