<script>
    import Variation from "./Variation";
    import Inquiry from './Inquiry';

    export default {
        props: ['data'],

        data() {
            return {
                productImage: this.data.image,
                inquirys: '',
                img: this.data.image,
                qty: 1,
            }
        },

        components: {Variation, Inquiry},


        methods: {
            slika(data) {
                if(data.image === '') {
                    this.$refs.image.src = this.$refs.image.src
                } else {
                    this.$refs.image.src = '/img/products/' + data.image;
                }
            },

            promena(e) {
                this.$refs.image.src = '/img/products/' + e.image
            },

            upit(e) {
                this.img = e.image === '' ? this.data.image : e.image;
                this.inquirys = e.name;
            },
        }
    }
</script>

<style scoped>

</style>