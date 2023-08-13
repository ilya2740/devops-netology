
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

    },
    {
        name  = "replica",
        #size = "s-2vcpu-2gb"
        image = "data.yandex_compute_image.ubuntu-2004-lts.image_id"
        #region = "lon1",
        tags = ["replica"]
        cores  = "5"
        memory = "2"
        core_fraction = "20"
    } 
]


