<?php $img_url = base_url() . "assets/img/"; ?>
<section class="" id="">
    <div class="container-fluid">
        <h1 class=""><strong>Course Web Timetables For Staff</strong></h1>
    </div>
    <div class="panel-body">

        <div class="col-md-6">
            <div class="form-group">
                <label class="col-md-3 control-label">Staff ID</label>
                <div class="col-md-9">
                    <form action="<?php echo site_url('Timetables/sskeyword'); ?>" method="POST">
                        <input type="number" name="staffID" required="" style="border-radius: 5px">
                        <button type="button" class="btn btn-light"><input type="submit" name="submit" value="Search" style="border: none;"></button>
                    </form>
                </div>
            </div>
        </div>

    </div>
</section>