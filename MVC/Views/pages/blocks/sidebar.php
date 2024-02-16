<ul class="menu__category">

    <?php 
    while($Categories=sqlsrv_fetch_array($data['Categories'])){
        ?>
    <div class="menu__category_POST" id="<?php echo $Categories['Name']; ?>">
        <li>
            <a href="/MVC_LuanVan/Home/Category/<?php echo $Categories["Id"]?>">
                <div class="icon_Categories">
                    <img class="icon_Categorie" src="<?php echo $Categories['Icon'];?>"></img>
                </div>
                <div class="content_Categories">
                    <p>
                        <?php echo $Categories["Name"];?>
                    </p>
                </div>
            </a>
        </li>
    </div>
    <?php } ?>
</ul>
