<script>
    import Variation from "./Variation";
    import Inquiry from './Inquiry';
    import 'viewerjs/dist/viewer.css';

    export default {
        props: ['data'],

        data() {
            return {
                productImage: this.data.image,
                inquirys: '',
                img: this.data.image,
                qty: 1,
                izmena: '',
                plu: '',
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

            variacija(e) {
                this.izmena = e.name;
            },

            utikac(e) {
                this.plu = e.name;
            }
        }
    }
</script>

<style scoped>

</style>