
servers = [
    {
        name  = "main",
        #size = "s-2vcpu-2gb"
        image = "data.yandex_compute_image.ubuntu-2004-lts.image_id"
        #region = "ams3",
        tags = ["main"]
        cores  = "2"
        memory = "1"
        core_fraction = "20"
        disk = "1"

    },
    {
        name  = "replica",
        #size = "s-2vcpu-2gb"
        image = "data.yandex_compute_image.ubuntu-2004-lts.image_id"
        #region = "lon1",
        tags = ["replica"]
        cores  = "4"
        memory = "2"
        core_fraction = "20"
        disk = "1"
    } 
]


storage = [
    {
       name = "storage",
       cores = 2,
       memory = 1,
       core_fraction = 20
   


    }
]



another_disks = [
{
        name       = "disk1"

},
{       name       = "disk2"
},
{
        name       = "disk3"
}

]