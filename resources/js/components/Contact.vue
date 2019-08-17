<template>
    <form>
        <div class="form-group lg:flex lg:justify-between">
            <div class="mr-2 w-full">
            <input class="p-2 bg-transparent w-full"
                   type="text"
                   name="firstname"
                   :class="errors.first('firstname') ? 'border-b border-red-700' : 'border'"
                   v-validate="'required'"
                   placeholder="Nafn"
                   id="firstname"
                   v-model="firstname">
            <span class="text-red-500 italic text-xs greska">{{ errors.first('firstname') }}</span>
            </div>
            <div class="w-full">
            <input class="p-2 w-full"
                   type="text"
                   name="lastname"
                   :class="errors.first('lastname') ? 'border-b border-red-700' : 'border'"
                   v-validate="'required'"
                   placeholder="Eftirnafn"
                   v-model="lastname">
            <span class="text-red-500 italic text-xs greska">{{ errors.first('lastname') }}</span>
            </div>
        </div>
        <div class="form-group">
            <input class="p-2 w-full"
                   type="email"
                   name="email"
                   :class="errors.first('email') ? 'border-b border-red-700' : 'border'"
                   v-validate="'required|email'"
                   placeholder="Netfang*"
                   v-model="email">
            <span class="text-red-500 italic text-xs greska">{{ errors.first('email') }}</span>
        </div>
        <div class="form-group">
            <input class="p-2 w-full"
                   type="text"
                   name="subject"
                   :class="errors.first('subject') ? 'border-b border-red-700' : 'border'"
                   v-validate="'required'"
                   placeholder="Titill*"
                   v-model="subject">
            <span class="text-red-500 italic text-xs greska">{{ errors.first('subject') }}</span>
        </div>
        <div class="form-group">
            <textarea class="p-2 w-full"
                      name="message" cols="30" rows="5"
                      placeholder="Skilaboð*"
                      v-validate="'required|min:3'"
                      :class="errors.first('message') ? 'border-b border-red-700' : 'border'"
                      v-model="message"></textarea>
            <span class="text-red-500 italic text-xs greska">{{ errors.first('message') }}</span>
        </div>
        <div class="form-group text-right">
            <button class="py-2 px-12 border border-black font-bold text-black uppercase" @click.prevent="sendMessage" type="submit">Senda</button>
        </div>
        <modal name="success" classes="modal_contact bg-white" height="auto">
            <section class="okolo_poruka m-3 p-2 border-2 border-grey text-center relative">
                <p class="text-sm message_success text-orange-light tracking-wide message_sent font-medium">MESSAGE SENT</p>
                <p class="text-right mb-1 absolute close_message">
                    <a class="text-xs font-serif mr-16 text-grey" href="#" @click="$modal.hide('success')"><i class="fas fa-times-circle"></i></a>
                </p>
                <div class="flex justify-center items-center mt-12">
                    <img src="/img/message-sent.svg" alt="Sent">
                </div>
                <h5 class="font-serif font-bold text-black tracking-wide mt-10 mb-8 text-xl">Your message has been successfully sent</h5>
            </section>
        </modal>
    </form>
</template>

<script>
    export default {
        data() {
            return {
                firstname: '',
                lastname: '',
                email: '',
                subject: '',
                message: '',
            }
        },

        methods: {
            sendMessage() {
                this.$validator.validate().then(valid => {
                    if (valid) {
                        axios.post('/hafdu-samband', {
                            firstname: this.firstname,
                            lastname: this.lastname,
                            email: this.email,
                            subject: this.subject,
                            message: this.message,
                        }).then(
                            this.$modal.show('success'),
                            this.firstname = '',
                            this.lastname = '',
                            this.email = '',
                            this.subject = '',
                            this.message = '',
                            this.$validator.reset(),
                            this.hide(),
                        );
                    }
                });
            },
            hide() {
                setTimeout(() => {
                    this.$modal.hide('success');
                }, 5000)
            },
        }
    }
</script>
